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
import java.util.List;
import java.util.Random;
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
public class StaffDetailsUpload extends HttpServlet {

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
            out.println("<title>Servlet StaffDetailsUpload</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffDetailsUpload at " + request.getContextPath() + "</h1>");
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
File file;
        String title = null;
String fname = null;
String mname = null;
String lname = null;
String dept = null;
String desg = null;
String doj = null;
String gender = null;
String add1 = null;
String add2 = null;
String city = null;
String state = null;
String pincode = null;
String padd1 = null;
String padd2 = null;
String pcity = null;
String pstate = null;
String ppincode = null;
String mobile1 = null;
String mobile2 = null;
String email = null;
String dob = null;
String bg = null;
String father = null;
String mother = null;
String caste = null;
String relegion = null;
String passno = null;
String panno = null;
String aadharno = null;
String nation = null;
String staffid = null;
String ll=null;
String pfno=null;
Random rn=new Random();
String path="staff/a"+rn.nextInt(1000)+"a";
String ext1=null,ext2=null,ext3=null;
String extmark[]=new String[20],extexp[]=new String[20];
int ext1l=0,ext2l=0,ext3l=0;
Integer extmarkl[] = new Integer[20] ,extexpl[] = new Integer[20];
int counter= 0,ecounter=0;
String[] category = new String[15],nod =new String[15],spl= new String[15],yop =new String[15],college= new String[15],university= new String[15],gpa= new String[15],pclass= new String[15];
String[] edoj =new String[15],edor =new String[15],enorg=new String[15],eaddr=new String[15],edesg=new String[15],enature=new String[15];
  
                       file=new File(Base.path+"/"+path+"/");
                         
                if(!file.exists())
                     file.mkdirs();
                
Connection con=null,conlogin=null;
Statement stmt=null,stmt1=null;

  
       if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
                
                for(FileItem item : multiparts){
                
                     if (item.isFormField()) {
                         
                    if(item.getFieldName().equals("title")){title=item.getString();}
                    else if(item.getFieldName().equals("fname")){fname=item.getString();}
else if(item.getFieldName().equals("staffid")){staffid=item.getString();}
else if(item.getFieldName().equals("mname")){mname=item.getString();}
else if(item.getFieldName().equals("count")){counter=Integer.parseInt(item.getString());}
else if(item.getFieldName().equals("ecount")){ecounter=Integer.parseInt(item.getString());}
else if(item.getFieldName().equals("lname")){lname=item.getString();}
else if(item.getFieldName().equals("dept")){dept=item.getString();}
else if(item.getFieldName().equals("desg")){desg=item.getString();}
else if(item.getFieldName().equals("doj")){doj=item.getString();}
else if(item.getFieldName().equals("gender")){gender=item.getString();}
else if(item.getFieldName().equals("add1")){add1=item.getString();}
else if(item.getFieldName().equals("add2")){add2=item.getString();}
else if(item.getFieldName().equals("city")){city=item.getString();}
else if(item.getFieldName().equals("state")){state=item.getString();}
else if(item.getFieldName().equals("pincode")){pincode=item.getString();}
else if(item.getFieldName().equals("padd1")){padd1=item.getString();}
else if(item.getFieldName().equals("padd2")){padd2=item.getString();}
else if(item.getFieldName().equals("pcity")){pcity=item.getString();}
else if(item.getFieldName().equals("pstate")){pstate=item.getString();}
else if(item.getFieldName().equals("ppincode")){ppincode=item.getString();}
else if(item.getFieldName().equals("mobile1")){mobile1=item.getString();}
else if(item.getFieldName().equals("mobile2")){mobile2=item.getString();}
else if(item.getFieldName().equals("ll")){ll=item.getString();}
else if(item.getFieldName().equals("email")){email=item.getString();}
else if(item.getFieldName().equals("dob")){dob=item.getString();}
else if(item.getFieldName().equals("bg")){bg=item.getString();}
else if(item.getFieldName().equals("father")){father=item.getString();}
else if(item.getFieldName().equals("mother")){mother=item.getString();}
else if(item.getFieldName().equals("caste")){caste=item.getString();}
else if(item.getFieldName().equals("relegion")){relegion=item.getString();}
else if(item.getFieldName().equals("nation")){nation=item.getString();}
else if(item.getFieldName().equals("passno")){passno=item.getString();}
else if(item.getFieldName().equals("panno")){panno=item.getString();}
else if(item.getFieldName().equals("aadharno")){aadharno=item.getString();}
else if(item.getFieldName().equals("pfno")){pfno=item.getString();}
else if(item.getFieldName().contains("category")){
category[Integer.parseInt(item.getFieldName().substring(8))]=new String();
category[Integer.parseInt(item.getFieldName().substring(8))]=item.getString();
//response.getWriter().println(category[Integer.parseInt(item.getFieldName().substring(8))]);
}
else if(item.getFieldName().contains("nod")){
nod[Integer.parseInt(item.getFieldName().substring(3))]=new String();
nod[Integer.parseInt(item.getFieldName().substring(3))]=item.getString();
//response.getWriter().println(nod[Integer.parseInt(item.getFieldName().substring(3))]);
}
else if(item.getFieldName().contains("spl")){
spl[Integer.parseInt(item.getFieldName().substring(3))]=new String();
spl[Integer.parseInt(item.getFieldName().substring(3))]=item.getString();
//response.getWriter().println(spl[Integer.parseInt(item.getFieldName().substring(3))]);
}
else if(item.getFieldName().contains("yop")){
yop[Integer.parseInt(item.getFieldName().substring(3))]=new String();
yop[Integer.parseInt(item.getFieldName().substring(3))]=item.getString();
//response.getWriter().println(yop[Integer.parseInt(item.getFieldName().substring(3))]);
}
else if(item.getFieldName().contains("college")){
college[Integer.parseInt(item.getFieldName().substring(7))]=new String();
college[Integer.parseInt(item.getFieldName().substring(7))]=item.getString();
//response.getWriter().println(college[Integer.parseInt(item.getFieldName().substring(7))]);

}else if(item.getFieldName().contains("university")){
university[Integer.parseInt(item.getFieldName().substring(10))]=new String();
university[Integer.parseInt(item.getFieldName().substring(10))]=item.getString();
//response.getWriter().println(university[Integer.parseInt(item.getFieldName().substring(10))]);

}else if(item.getFieldName().contains("gpa")){
gpa[Integer.parseInt(item.getFieldName().substring(3))]=new String();
gpa[Integer.parseInt(item.getFieldName().substring(3))]=item.getString();
//response.getWriter().println(gpa[Integer.parseInt(item.getFieldName().substring(3))]);

}else if(item.getFieldName().contains("class")){
pclass[Integer.parseInt(item.getFieldName().substring(5))]=new String();
pclass[Integer.parseInt(item.getFieldName().substring(5))]=item.getString();
//response.getWriter().println(pclass[Integer.parseInt(item.getFieldName().substring(5))]);

}else if(item.getFieldName().contains("edoj")){
edoj[Integer.parseInt(item.getFieldName().substring(4))]=new String();
edoj[Integer.parseInt(item.getFieldName().substring(4))]=item.getString();
//response.getWriter().println(pclass[Integer.parseInt(item.getFieldName().substring(5))]);

}else if(item.getFieldName().contains("edor")){
edor[Integer.parseInt(item.getFieldName().substring(4))]=new String();
edor[Integer.parseInt(item.getFieldName().substring(4))]=item.getString();
//response.getWriter().println(pclass[Integer.parseInt(item.getFieldName().substring(5))]);

}else if(item.getFieldName().contains("enorg")){
enorg[Integer.parseInt(item.getFieldName().substring(5))]=new String();
enorg[Integer.parseInt(item.getFieldName().substring(5))]=item.getString();
//response.getWriter().println(pclass[Integer.parseInt(item.getFieldName().substring(5))]);

}else if(item.getFieldName().contains("edesg")){
edesg[Integer.parseInt(item.getFieldName().substring(5))]=new String();
edesg[Integer.parseInt(item.getFieldName().substring(5))]=item.getString();
//response.getWriter().println(pclass[Integer.parseInt(item.getFieldName().substring(5))]);

}else if(item.getFieldName().contains("enature")){
enature[Integer.parseInt(item.getFieldName().substring(7))]=new String();
enature[Integer.parseInt(item.getFieldName().substring(7))]=item.getString();
//response.getWriter().println(pclass[Integer.parseInt(item.getFieldName().substring(5))]);

}else if(item.getFieldName().contains("eaddr")){
eaddr[Integer.parseInt(item.getFieldName().substring(5))]=new String();
eaddr[Integer.parseInt(item.getFieldName().substring(5))]=item.getString();
//response.getWriter().println(pclass[Integer.parseInt(item.getFieldName().substring(5))]);

}


                     }else{
                       
                
                     if(item.getFieldName().equals("passsc")){
                     
                     ext1=item.getName();
                     if(!item.getName().equals(""))
                     {
                     item.write(new File(Base.path+File.separator+path+File.separator+ext1));
                    ext1l=(int)new File(Base.path+File.separator+path+File.separator+ext1).length();
                     }
                     }
                     else if(item.getFieldName().equals("pansc")){
                    
                     ext2=item.getName();
                      if(!item.getName().equals(""))
                     {
                    item.write(new File(Base.path+File.separator+path+File.separator+ext2));
                   
                    ext2l=(int)new File(Base.path+File.separator+path+File.separator+ext2).length();
                     }
                     }
                     else if(item.getFieldName().equals("aadharsc")){
                     
                     ext3=item.getName();
                     if(!item.getName().equals(""))
                     {
                    item.write(new File(Base.path+File.separator+path+File.separator+ext3));
                   
                    ext3l=(int)new File(Base.path+File.separator+path+File.separator+ext3).length();
                     }
                     }else if(item.getFieldName().contains("marksc")){
                        
                         
                     extmark[Integer.parseInt(item.getFieldName().substring(6))]=new String();
                     extmark[Integer.parseInt(item.getFieldName().substring(6))]=item.getName();
                     if(!item.getName().equals(""))
                     {
                    item.write(new File(Base.path+File.separator+path+File.separator+extmark[Integer.parseInt(item.getFieldName().substring(6))]));
                   
                    extmarkl[Integer.parseInt(item.getFieldName().substring(6))]=(int)new File(Base.path+File.separator+path+File.separator+extmark[Integer.parseInt(item.getFieldName().substring(6))]).length();
                     }
                     }
                     else if(item.getFieldName().contains("expsc")){
                        
                         
                     extexp[Integer.parseInt(item.getFieldName().substring(5))]=new String();
                     extexp[Integer.parseInt(item.getFieldName().substring(5))]=item.getName();
                     if(!item.getName().equals(""))
                     {
                    item.write(new File(Base.path+File.separator+path+File.separator+extexp[Integer.parseInt(item.getFieldName().substring(5))]));
                   
                    extexpl[Integer.parseInt(item.getFieldName().substring(5))]=(int)new File(Base.path+File.separator+path+File.separator+extexp[Integer.parseInt(item.getFieldName().substring(5))]).length();
                     }
                     }
                     }
                     
                }
                if(ext1!=null && passno!="" && ext1!="")
                passno=passno.concat(ext1.substring(ext1.indexOf('.')));
                if(ext2!=null && panno!="" && ext2!="")
                panno=panno.concat(ext2.substring(ext2.indexOf('.')));
                if(ext3!=null && aadharno!="" && ext3!="")
                aadharno=aadharno.concat(ext3.substring(ext3.indexOf('.')));
              
                
                //response.getWriter().println("All Data Received Successfully");
              
                con=new dbcon().getConnection(dept);
                stmt=con.createStatement();
                conlogin=new dbcon().getConnection("login");
                stmt1=conlogin.createStatement();
                try{
                    String name=fname+" "+mname+" "+lname;
                    String sql;
                    int count=0;
                     sql = "delete from staff_login_details  where staffid='" + staffid + "'";
                    stmt1.execute(sql);
                    String genpass=GeneratePassword.next();
                    sql = "insert into staff_login_details values('" + staffid + "','" + genpass + "')";
                    count+=stmt1.executeUpdate(sql);
                    sql="insert into staff_table values('"+name+"','"+staffid+"')";
                    count+=stmt.executeUpdate(sql);
                    sql="insert into staff_general values('"+staffid+"','"+title+"','"+name+"','"+desg+"','"
                            +Date.valueOf(doj)+"','"+gender+"','"+add1+"','"+add2+"','"+city+"','"+state+"','"+pincode+
                            "','"+padd1+"','"+padd2+"','"+pcity+"','"+pstate+"','"+ppincode+"','"+mobile1+"','"+mobile2+"','"+email+"','"+ll+
                            "')";
                    count+=stmt.executeUpdate(sql);
                    sql="insert into staff_personal values('"+staffid+"','"+Date.valueOf(dob)+"','"+bg+"','"+father+"','"
                            +mother+"','"+caste+"','"+relegion+"','"+nation+
                            "')";
                    count+=stmt.executeUpdate(sql);
                   FileInputStream passport = null,pancard = null,aadharcard = null;
                    if(ext1l!=0)
                    passport=new FileInputStream(Base.path+File.separator+path+File.separator+ext1);
                    if(ext2l!=0)
                    pancard=new FileInputStream(Base.path+File.separator+path+File.separator+ext2);
                    if(ext3l!=0)
                    aadharcard=new FileInputStream(Base.path+File.separator+path+File.separator+ext3);
                    
                    
                
                    sql="insert into staff_files values('"+staffid+"','"+passno+"',?,'"+panno+"',?,'"+aadharno+"',?,'"+pfno+
                            "')";
                    PreparedStatement statement=con.prepareStatement(sql);
                    statement.setBinaryStream(1, passport,ext1l);
                    statement.setBinaryStream(2,pancard,ext2l);
                    statement.setBinaryStream(3,aadharcard,ext3l);
                    statement.executeUpdate();
                    if(passport!=null)
                    passport.close();
                    if(pancard!=null)
                    pancard.close();
                    if(aadharcard!=null)
                    aadharcard.close();
                    
                    for(int i=0;i<counter;i++)
                    {
                    sql="insert into staff_edu values("+null+",'"+staffid+"','"+category[i]+"','"
                            +nod[i]+"','"+spl[i]+"','"+yop[i]+"','"+college[i]+"','"+university[i]+"','"
                            +gpa[i]+"','"+pclass[i]+"','"+extmark[i]+
                            
                            "',?);";
                    InputStream is=null;
                    
                    if(extmarkl[i]!=0)
                    {
                        is=new FileInputStream(Base.path+File.separator+path+File.separator+extmark[i]);
                   
                    statement=con.prepareStatement(sql);
                    statement.setBinaryStream(1,is,extmarkl[i]);
                    statement.executeUpdate();
                    if(is!=null)
                    is.close();
                    }
                    }
                    
                    for(int i=0;i<ecounter;i++)
                    {
                    sql="insert into staff_experience values("+null+",'"+staffid+"','"+Date.valueOf(edoj[i])+"','"
                            +Date.valueOf(edor[i])+"','"+enorg[i]+"','"+eaddr[i]+"','"+edesg[i]+"','"+enature[i]+"','"+extexp[i]
                            +"',?);";
                    InputStream is=null;
                    if(extexpl[i]!=0)
                     is=new FileInputStream(Base.path+File.separator+path+File.separator+extexp[i]);
                   
                    statement=con.prepareStatement(sql);
                    statement.setBinaryStream(1,is,extexpl[i]);
                    statement.executeUpdate();
                    if(is!=null)
                    is.close();
                    }
                     //   response.getWriter().println("Values Updated");
                    
       
       response.sendRedirect("admin/StaffAdded.jsp?msg=Staff Added Successsfully!!&msg1=Password :"+genpass+"&msg2="+staffid);
                }catch(Exception e){
                    e.printStackTrace(response.getWriter());
                    e.printStackTrace();
                String sql;
                sql="delete from staff_table where staffid='"+staffid+"';";
                stmt.executeUpdate(sql);
                sql="delete from staff_edu where staffid='"+staffid+"';";
                stmt.executeUpdate(sql);
                sql="delete from staff_experience where staffid='"+staffid+"';";
                stmt.executeUpdate(sql);
                sql="delete from staff_general where staffid='"+staffid+"';";
                stmt.executeUpdate(sql);
                sql="delete from staff_personal where staffid='"+staffid+"';";
                stmt.executeUpdate(sql);
                sql="delete from staff_files where staffid='"+staffid+"';";
                stmt.executeUpdate(sql);
                
       response.sendRedirect("admin/StaffAdded.jsp?msg=Some Error Occured!!Try Again"+e);
               
                
                }
            }catch(Exception e){
                e.printStackTrace();
            }finally{
                 File dir=new File(Base.path+File.separator+path);
          
                try{
                    
        if(dir.exists())
            FileUtils.deleteDirectory(dir);
          
            if(stmt!=null)
                stmt.close();
            if(con!=null)
                con.close();
            if(stmt1!=null)
                stmt1.close();
            if(conlogin!=null)
                conlogin.close();
            
                }catch(Exception e){
                e.printStackTrace();
                }
                
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

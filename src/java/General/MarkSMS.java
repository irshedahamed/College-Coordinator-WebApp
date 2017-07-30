/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

import com.action.Find;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Home
 */
public class MarkSMS {
    
    public static String getContent(String rollno,String sem,String exam){    
         Connection conn=null;
    Statement stmt=null;
    String marks="";
    String pass;
    String name="";
    String status;
    String content;
    try{
    conn=new dbcon().getConnection(Find.sdept(rollno));
    stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("SELECT model"+exam+",cycle"+exam+",unit"+exam+",subcode FROM marks_table where rollno='"+rollno+"' and sem like '"+sem+"'");
    int i=0;    
    while(rs.next())
        {
            i++;
            int mark;
            String subcode=rs.getString("subcode").toUpperCase();
            subcode="Sub"+i+"("+subcode+")";
             if(rs.getString("cycle"+exam).equals("N"))
             {
                 String a=rs.getString("model"+exam);
                 if(a.equals("A"))
                     a="0";
                 mark=Integer.parseInt(a);
             }
             else{
                 String markm,markc,marku;
                 markm=rs.getString("model"+exam);
                 markc=rs.getString("cycle"+exam);
                 marku=rs.getString("unit"+exam);
                 int m,c,u;
                 if(markm==null) 
            markm="0";
        else if(markm.equals("null"))
            markm="0";
      
        if(markc==null) 
            markc="0";
        else if(markc.equals("null"))
            markc="0";
      
        if(marku==null) 
            marku="0";
        else if(marku.equals("null"))
            marku="0";
      
        
        if(markm.equals("A"))
        {
            m=0;
        }
        else
         m = Integer.parseInt(markm);
        
        
        if(markc.equals("A"))
        c=0;
        else
        c = Integer.parseInt(markc);
        
        if(marku.equals("A"))
        u=0;
        else
        u = Integer.parseInt(marku);
              float t=(float)m+ ( (float)c /2 )+ ( ((float)u / 48)*15 );
            
                t/=1.3;
                t=(int)(t+0.5);//Rounding
                mark=(int)t;
             }
            mark=(int) (mark/1.3);
            
             if((rs.getString("cycle"+exam).equals("A")||(rs.getString("cycle"+exam).equals("N")))&&rs.getString("model"+exam).equals("A"))
                marks+=subcode+":"+"A"+", ";
             else
            marks+=subcode+":"+mark+", ";
        }
        if(rs!=null)
        rs.close();
        rs=stmt.executeQuery("select name from student_personal where rollno like '"+rollno+"'");
        if(rs.next())
            name=rs.getString("name");
        
        if(rs!=null)
        rs.close();
        
    }catch(Exception e){e.printStackTrace();}finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                conn.close();
        } catch (SQLException ex) {
        ex.printStackTrace();
        }
    }
    
    
    int num=Result.numSubFailed(rollno, sem, exam);
    if(num==0)
    {pass="PASSED";status="happy";}
    else
    {   
        pass="FAILED in "+num+" Subjects";
    if(num==1)
        pass=pass.substring(0, pass.length()-1);
    status="sorry";
    }
    
    content="Dear Parents, " +
"We are "+status+" to inform you that your ward "+name+" ("+rollno+") has "+pass+" in the Model-"+exam+" Examination,Securing the following Marks "+marks.substring(0, marks.length()-2)+".Refer Portal for further details";
   
    return content;
    }
    
}

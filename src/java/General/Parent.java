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
public class Parent {
    public static String getNumber(String rollno){
    Connection conn=null;
       Statement stmt=null;
       String number="";
       try{
           conn=new dbcon().getConnection(Find.sdept(rollno));
           stmt=conn.createStatement();
           String sql="select mobile from student_father_details where rollno='"+rollno+"'";
       ResultSet rs=stmt.executeQuery(sql);
       
       if(rs.next())
       {
       number=rs.getString("mobile");
      
       if(number==null || number.trim().equals(""))
       {  
       
           sql="select mobileno from student_mother_details where rollno='"+rollno+"'";
           rs=stmt.executeQuery(sql);
           if(rs.next())
       {
           
       number=rs.getString("mobileno");
       
       }
       }   
           
       }
       
       
       }catch(Exception e){
       e.printStackTrace();
       }finally{
           try {
               if(stmt!=null)
                   stmt.close();
               if(conn!=null)
                   conn.close();
           } catch (SQLException ex) {
               ex.printStackTrace();
           }
       
       }
    
    return number;
    
    }
}

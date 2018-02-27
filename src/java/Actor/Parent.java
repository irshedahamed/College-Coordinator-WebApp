/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actor;

import com.action.Find;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
        PreparedStatement stmt=null;
       String number="";
       try{
           conn=new dbcon().getConnection(Find.sdept(rollno));
           stmt=conn.prepareStatement("select mobile from student_father_details where rollno=?");
           stmt.setString(1, rollno);
          // String sql=;
       ResultSet rs=stmt.executeQuery();
       
       if(rs.next())
       {
       number=rs.getString("mobile");
      
       if(number==null || number.trim().equals("")||number.equals("NA"))
       {  
       
          String sql="select mobileno from student_mother_details where rollno=?";
           stmt=conn.prepareStatement(sql);
           stmt.setString(1, rollno);
           rs=stmt.executeQuery();
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
                   ;//conn.close();
           } catch (SQLException ex) {
               ex.printStackTrace();
           }
       
       }
    
    return number;
    
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Home
 */
public class SpecialFee extends Fee{
    private String rollno;
    private String academicyr;
    

    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getAcademicyr() {
        return academicyr;
    }

    public void setAcademicyr(String academicyr) {
        this.academicyr = academicyr;
    }

   
    
    public boolean insert(){
    Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           
           String sql;
                  sql="delete from spl_fee where rollno='"+rollno+"' and academicyr='"+academicyr+"'";
                        stmt.executeUpdate(sql);
       
           sql="insert into spl_fee values('"+rollno+"','"+academicyr+"','"+tution+"','"+transport+"','"+placement+"','"+hostel+"','"+development+"')";
       update+=stmt.executeUpdate(sql);
       
     
       
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
       if(update==1)
           return true;
       else
           return false;
    }
    
    public static SpecialFee getFee(String rollno,String academicyr){
    
    
            Connection conn=null;
    Statement stmt=null;
  SpecialFee b=null;
        try{
            
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from spl_fee where rollno like '"+rollno+"' and academicyr like '"+academicyr+"'");
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                         b=new SpecialFee();
                        b.setRollno(rs.getString("rollno"));
                        b.setHostel(rs.getString("hostel"));
                        b.setPlacement(rs.getString("placement"));
                        b.setTransport(rs.getString("transport"));
                        b.setTution(rs.getString("tution"));
                        b.setAcademicyr(rs.getString("academicyr"));
                        b.setDevelopment(rs.getString("development"));
                        
                       
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
        
    
    return b;
    }
}

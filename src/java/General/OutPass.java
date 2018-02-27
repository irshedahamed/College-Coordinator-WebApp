/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

import Actor.Student;
import com.action.Find;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

/**
 *
 * @author Home
 */
public class OutPass {
    private String id;
    private String expiry;

    public OutPass(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getExpiry() {
        return expiry;
    }

    
    
      public boolean insert(String requestid){
        Connection conn=null;
          PreparedStatement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           //stmt=conn.createStatement();
           
           String sql="insert into outpass values(?,?,now())";
           stmt=conn.prepareStatement(sql);
           stmt.setString(1, requestid);
           stmt.setString(2, this.id);
           update+=stmt.executeUpdate();
       
     
       
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
      
      public  boolean isExpired(){
        
               Connection conn=null;
                 PreparedStatement stmt=null;
                 boolean valid=false;
   
        try{
            
    conn=new dbcon().getConnection("sjitportal");
    
    String sql="select * from outpass where rollno like ? and expiry >= now()-INTERVAL 6 HOUR";
    stmt=conn.prepareStatement(sql);
    stmt.setString(1, id);
    ResultSet rs=stmt.executeQuery();
                    
                    rs.beforeFirst();
                    if(rs.next()){
                       valid=true;
                        
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
        
    
    return valid;
    }
      
      public static String getnextID(String type){
        Connection  conn=null;
        PreparedStatement stmt=null;
        int res=0;
          try{
            
    conn=new dbcon().getConnection("sjitportal");
  //  stmt = conn.createStatement();
    String sql="select MAX(CONVERT(SUBSTR(id,13,8),unsigned int)) as res  from sjitportal.outpass where id like '%STAFF%'";
    stmt=conn.prepareStatement(sql);
    ResultSet rs=stmt.executeQuery();
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        res=rs.getInt("res");
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
          
          return "OUTPASSSTAFF"+(res+1);
      }
}

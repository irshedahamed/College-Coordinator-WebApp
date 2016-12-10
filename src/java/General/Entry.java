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
import java.sql.Timestamp;

/**
 *
 * @author Home
 */
public class Entry {
    private String rollno;
    private Timestamp in;
    private Timestamp out;

    public Timestamp getIn() {
        return in;
    }

    public void setIn(Timestamp in) {
        this.in = in;
    }

    public Timestamp getOut() {
        return out;
    }

    public void setOut(Timestamp out) {
        this.out = out;
    }


    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

   
    
    public boolean insertin(){
        Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           String sql="insert into entry values('"+rollno+"',now(),'0000-00-00 00:00:00')";
       update+=stmt.executeUpdate(sql);
       
     
       
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
       if(update==1)
           return true;
       else
           return false;
    }
    
     public boolean insertout(){
        Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           String sql="insert into entry values('"+rollno+"','0000-00-00 00:00:00',now())";
       update+=stmt.executeUpdate(sql);
       
     
       
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
       if(update==1)
           return true;
       else
           return false;
    }
}

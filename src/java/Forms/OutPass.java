/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Forms;

import Actor.Student;
import com.action.Find;
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
public class OutPass {
    
    private String rollno;
    private String reason;
    private String from;
    private String till;
    private String letter;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    

    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTill() {
        return till;
    }

    public void setTill(String till) {
        this.till = till;
    }

    public String getLetter() {
        return letter;
    }

    public void setLetter(String letter) {
        this.letter = letter;
    }
    
    
     public boolean insert(){
        Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           
           String sql="insert into outpassform values('OUTPASS',null,'"+rollno+"','"+reason+"','"
                   +"','"+from+"','"+till+"','"+letter+"','Waitng for Response')";
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

    public List<OutPass> getbyIdAll(){
        Connection conn=null;
    Statement stmt=null;
    List<OutPass> list=new ArrayList<OutPass>();
        try{
            
    conn=new dbcon().getConnection(Find.dept(rollno));
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from outpassform where rollno like '"+rollno+"'");
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        OutPass o=new OutPass();
                        o.setFrom(rs.getString("from"));
                        o.setTill(rs.getString("till"));
                        o.setLetter(rs.getString("letter"));
                        o.setReason(rs.getString("reason"));
                        o.setRollno(rs.getString("rollno"));
                        o.setStatus(rs.getString("status"));
                        list.add(o);
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
        
    
    return list;
    }
    
    public static List<OutPass> getAllPending(){
        Connection conn=null;
    Statement stmt=null;
    List<OutPass> list=new ArrayList<OutPass>();
     
    try{
            
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from outpassform where status like 'Waiting%'");
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        OutPass o=new OutPass();
                        o.setFrom(rs.getString("from"));
                        o.setTill(rs.getString("till"));
                        o.setLetter(rs.getString("letter"));
                        o.setReason(rs.getString("reason"));
                        o.setRollno(rs.getString("rollno"));
                        o.setStatus(rs.getString("status"));
                        list.add(o);
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
    
    
    return list;
    }
}

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
    private String requestid;

    public String getRequestid() {
        return requestid;
    }
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

 
    
     public boolean insert(){
        Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           String sql;
           sql="select * from outpassform where rollno='"+rollno+"' and status='Waiting for Response' and reason='"+reason+"'";
           ResultSet rs=stmt.executeQuery(sql);
           
           if(rs.next())
               update+=update(stmt);
           else{
          sql="insert into outpassform values('OUTPASS',null,'"+rollno+"','"+reason+"'"
                   +",'"+from+"','"+till+"','"+""+"','Waiting for Response')";
       update+=stmt.executeUpdate(sql);
           }
           
           sql="select * from outpassform where rollno='"+rollno+"' and status='Accepted' and reason='"+reason+"' and `from`='"+from+"'";
          
           rs=stmt.executeQuery(sql);
           if(rs.next()){
               requestid=rs.getString("prefix")+rs.getString("sno");
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
       if(update==1)
           return true;
       else
           return false;
    }
     
     private int update(Statement stmt) throws SQLException{
   
         return stmt.executeUpdate("update outpassform set status='"+status+"',`from`='"+from+"',till='"+till+
                 "' where rollno='"+rollno+"' and status like 'Waiting for Response'");
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
                       // o.setLetter(rs.getString("letter"));
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
                       // o.setLetter(rs.getString("letter"));
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

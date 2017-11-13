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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author Home
 */
public class Entry {
    private String rollno;
    private Timestamp in;
    private Timestamp out;
    private String by;

    public String getBy() {
        return by;
    }

    public void setBy(String by) {
        this.by = by;
    }

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

   public String getSMSContent(String action){
        if(Student.getById(rollno).getAccomodation().equalsIgnoreCase("hostel")){
       if(action.equals("IN"))
           return "Your ward "+Student.getById(rollno).getName()+"("+rollno+") reported to hostel on "+new Date();
       else
           return "Your ward "+Student.getById(rollno).getName()+"("+rollno+") left from  hostel at "+new Date()+"";
        
        }else{
            
       if(action.equals("IN"))
           return "Your ward "+Student.getById(rollno).getName()+"("+rollno+") has entered our premises at "+new Date();
       else
           return "Your ward "+Student.getById(rollno).getName()+"("+rollno+") left our premises at "+new Date()+"";
       
        }
   }
    
    public boolean insertin(){
        Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           if(by==null)
               by="self";
           String sql="insert into entry values('"+rollno+"',now(),'0000-00-00 00:00:00','"+by+"')";
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
    
     public boolean insertout(){
        Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
            if(by==null)
               by="self";
           String sql="select * from entry where rollno like '"+rollno+"' and intime > now() - INTERVAL 24 HOUR";
           ResultSet rs=stmt.executeQuery(sql);
           if(rs.next()){
               String intime=rs.getTimestamp("intime").toString();
               intime=intime.substring(0, intime.length()-2);
            sql="update  entry set outtime=now() , `by`='"+by+"' where rollno like '"+rollno+"' and intime like'"+intime+"'";
               System.err.println(sql);
            rs.close();
       update+=stmt.executeUpdate(sql);
               
           }else{
            sql="insert into entry values('"+rollno+"','0000-00-00 00:00:00',now(),'"+by+"')";
       update+=stmt.executeUpdate(sql);
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
       if(update==1)
           return true;
       else
           return false;
    }
     
     
     public static Set<String> getUnreportedList(String date){
        Connection conn=null;
       Statement stmt=null;
       Statement stmt2=null;
       int update=0;
       Set<String> list=new TreeSet<String>();
       
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           stmt2=conn.createStatement();
           String sql="select opf.rollno,opf.`from`,opf.till,op.expiry,opf.sno,e.outtime from outpass op,outpassform opf,entry e where opf.till='"+date+"'- INTERVAL 24 HOUR and opf.status='Accepted' and op.id=CONCAT(opf.prefix,opf.sno) and e.rollno=opf.rollno and e.outtime>op.expiry and e.outtime<=op.expiry+interval 6 hour;";
           ResultSet rs=stmt.executeQuery(sql);
           while(rs.next()){
             String sql1="select * from entry where intime>'"+rs.getString("outtime")+"' and intime<'"+rs.getString("till")+"' + INTERVAL 33 HOUR and rollno ='"+rs.getString("rollno")+"'";
             ResultSet rs1=stmt2.executeQuery(sql1);
             if(!rs1.next()){
                 list.add(rs.getString("rollno"));
           }
           }
     
       
       }catch(Exception e){
       e.printStackTrace();
       }finally{
           try {
               if(stmt!=null)
                   stmt.close();
               if(stmt2!=null)
                   stmt2.close();
               if(conn!=null)
                   ;//conn.close();
           } catch (SQLException ex) {
               ex.printStackTrace();
           }
       
       }
       
           return list;
      
    }
}

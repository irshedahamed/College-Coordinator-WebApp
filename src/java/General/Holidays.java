/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Home
 */
public class Holidays {

    String name;
    String dept;
    String batch;
    String from;
    String till;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
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
        PreparedStatement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection(dept);
           
           
           String sql;
           sql="select * from holidays where name=? and batch =?";
           stmt=conn.prepareStatement(sql);
           stmt.setString(1, name);
           stmt.setString(2, batch);
           ResultSet rs=stmt.executeQuery();
           if(rs.next()){
           update+=update(stmt);
           }else{
           //sql=;
           stmt=conn.prepareStatement("insert into holidays values(?,?,?,?)");
           stmt.setString(1, name);
           stmt.setString(2, batch);
           stmt.setString(3, from);
           stmt.setString(4, till);
           update+=stmt.executeUpdate();
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
    
    private int update(Statement stmt) throws SQLException{
        
        return stmt.executeUpdate("update holidays set `from`='"+from+"',till='"+till+"' where batch ='"+batch+"' and name='"+name+"'");
    
    }

    public static List<String> getAllNames(){
        List<String> list=new ArrayList<String>();
        Connection conbatch=null;
        PreparedStatement stmt=null;
        try{
         conbatch = new dbcon().getConnection("sjitportal");
                     stmt = conbatch.prepareStatement("select * from holidays");
                    ResultSet rs=stmt.executeQuery();
                    
                    rs.beforeFirst();
                    while(rs.next())
                    {
                    String name;
                    name=rs.getString("name");
                    list.add(name);
                    }
        }catch(Exception e){
        e.printStackTrace();
        }
        finally{
            try {
                if(stmt!=null)
                    stmt.close();
                if(conbatch!=null)
                    ;//conbatch.close();
            } catch (SQLException ex) {
                Logger.getLogger(Batch.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return list;
    }
    
    
    public static List<Holidays> getAll(String dept){
        List<Holidays> list=new ArrayList<Holidays>();
        Connection conbatch=null;
        PreparedStatement stmt=null;
        try{
         conbatch = new dbcon().getConnection(dept);
                     stmt = conbatch.prepareStatement("select * from holidays");
                    ResultSet rs=stmt.executeQuery();
                    
                    rs.beforeFirst();
                    while(rs.next())
                    {
                    Holidays l=new Holidays();
                    l.setName(rs.getString("name"));
                    l.setDept(dept);
                    l.setFrom(rs.getString("from"));
                    l.setTill(rs.getString("till"));
                    l.setBatch(rs.getString("batch"));
                    list.add(l);
                    }
        }catch(Exception e){
        e.printStackTrace();
        }
        finally{
            try {
                if(stmt!=null)
                    stmt.close();
                if(conbatch!=null)
                    ;//conbatch.close();
            } catch (SQLException ex) {
                Logger.getLogger(Batch.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return list;
    }
}

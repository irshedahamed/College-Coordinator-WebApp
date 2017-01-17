/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import Forms.OutPass;
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
public class BasicFee {
    
    public static final String[] types={"Government","Management","Sports"};
    private String batch;
    private String type;
    private String tution;
    private String transport;
    private String hostel;
    private String placement;

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTution() {
        return tution;
    }

    public void setTution(String tution) {
        this.tution = tution;
    }

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public String getHostel() {
        return hostel;
    }

    public void setHostel(String hostel) {
        this.hostel = hostel;
    }

    public String getPlacement() {
        return placement;
    }

    public void setPlacement(String placement) {
        this.placement = placement;
    }
    
    public boolean insert(){
    Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           
           String sql;
                  sql="delete from basic_fee where batch='"+batch+"' and type='"+type+"'";
                        stmt.executeUpdate(sql);
       
           sql="insert into basic_fee values('"+batch+"','"+type+"','"+tution+"','"+transport+"','"+placement+"','"+hostel+"')";
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
    
    public static BasicFee getByType(List<BasicFee> list,String type){
    for(BasicFee bf:list)
        if(bf.getType().equals(type))
            return bf;
    return null;
    }
    
    public static List<BasicFee> getByBatch(String batch){
    
            Connection conn=null;
    Statement stmt=null;
    List<BasicFee> list=new ArrayList<BasicFee>();
        try{
            
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from basic_fee where batch like '"+batch+"'");
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        BasicFee b=new BasicFee();
                        b.setBatch(rs.getString("batch"));
                        b.setHostel(rs.getString("hostel"));
                        b.setPlacement(rs.getString("placement"));
                        b.setTransport(rs.getString("transport"));
                        b.setTution(rs.getString("tution"));
                        b.setType(rs.getString("type"));
                        
                        list.add(b);
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

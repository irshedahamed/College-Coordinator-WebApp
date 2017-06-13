/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Transport;

import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Fluffy
 */
public class RouteMap {
    
    private String boardingpt;
    private String routeid;
    private String priority;
    private Integer seqno;

    public String getBoardingpt() {
        return boardingpt;
    }

    public void setBoardingpt(String boardingpt) {
        this.boardingpt = boardingpt;
    }

    public String getRouteid() {
        return routeid;
    }

    public void setRouteid(String routeid) {
        this.routeid = routeid;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public Integer getSeqno() {
        return seqno;
    }

    public void setSeqno(Integer seqno) {
        this.seqno = seqno;
    }
    
    
       public static List<RouteMap> getByid(String id){
    
         Connection conn=null;
    Statement stmt=null;
   List<RouteMap> list=new ArrayList<RouteMap>();
        try{
            
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from routemap where routeid='"+id+"' order by seqno");
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                       RouteMap rm =new RouteMap();
                       rm.setBoardingpt(rs.getString("boardingpt"));
                       rm.setRouteid(rs.getString("routeid"));
                       rm.setPriority(rs.getString("priority"));
                       rm.setSeqno(rs.getInt("seqno"));
                       list.add(rm);
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
    
           public boolean insert(){
        Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           String sql="insert into routemap values('"+boardingpt+"','"+routeid+"','"+priority+"',"+seqno+")";
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

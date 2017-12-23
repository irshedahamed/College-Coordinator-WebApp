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
    
    private String boardingpt1;
    private String boardingpt2;
   // private String routeid;
    //private String priority;
    //private Integer seqno;
    

    public String getBoardingpt1() {
        return boardingpt1;
    }

    public void setBoardingpt1(String boardingpt1) {
        this.boardingpt1 = boardingpt1;
    }
    public String getBoardingpt2() {
        return boardingpt2;
    }

    public void setBoardingpt2(String boardingpt2) {
        this.boardingpt2 = boardingpt2;
    }
/*
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
    */
    
        public static List<RouteMap> getByBoardingpt1(String bp1){
    
         Connection conn=null;
    Statement stmt=null;
   List<RouteMap> list=new ArrayList<RouteMap>();
        try{
            
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from routemap where boardingpoint1 like '"+bp1+"'");
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                       RouteMap rm =new RouteMap();
                       rm.setBoardingpt1(rs.getString("boardingpoint1"));
                       rm.setBoardingpt2(rs.getString("boardingpoint2"));
                      /*rm.setBoardingpt(rs.getString("boardingpt"));
                       rm.setRouteid(rs.getString("routeid"));
                       rm.setPriority(rs.getString("priority"));
                       rm.setSeqno(rs.getInt("seqno"));*/
                       list.add(rm);
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
        
    
    
 return list;
    }
    
           public boolean insert(){
        Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           String sql="insert into routemap values('"+boardingpt1+"','"+boardingpt2+"')";
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
           
           public static List<RouteMap> getAll(){
    
         Connection conn=null;
    Statement stmt=null;
   List<RouteMap> list=new ArrayList<RouteMap>();
        try{
            
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from boardingpts order by name");
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        //System.out.println(rs.getString("name"));
                       RouteMap rm =new RouteMap();
                       rm.setBoardingpt1(rs.getString("name"));
                       //rm.setBoardingpt2(rs.getString("boardingpoint2"));
                       list.add(rm);
                       
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
        
    
    
 return list;
    }

}

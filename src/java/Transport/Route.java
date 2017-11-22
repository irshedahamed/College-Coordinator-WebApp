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
public class Route {
    
    
    private String id;
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
    public static List<Route> getAll(){
    
         Connection conn=null;
    Statement stmt=null;
   List<Route> list=new ArrayList<Route>();
        try{
            
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from busroutes order by id");
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                       Route r =new Route();
                       r.setId(rs.getString("id"));
                       r.setName(rs.getString("name"));
                       list.add(r);
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
   
    
    
     public static Route getByid(List<Route> list,String id){
         
         for(Route r:list)
             if(r.getId().equals(id))
                 return r;
         
         return null;
     }
}

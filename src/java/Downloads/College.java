/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Downloads;

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
public class College {
    
    public static List<Circular> getAll(String type){
    List<Circular> list = new ArrayList<Circular>();
    Connection conn=null;
        PreparedStatement stmt=null;
    try{
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.prepareStatement("select * from circular where type like ? order by sno desc");
    stmt.setString(1, type);
                    ResultSet rs=stmt.executeQuery();
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        Circular c=new Circular();
                       c.setName(rs.getString("name"));
                       c.setDesc(rs.getString("des"));
                       c.setPath(rs.getString("path"));
                       c.setType(type);
                       list.add(c);
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

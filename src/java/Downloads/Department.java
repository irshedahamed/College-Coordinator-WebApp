/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Downloads;

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
public class Department {
     public static List<Circular> getAll(String dept,String type,String clg){
    List<Circular> list = new ArrayList<Circular>();
    Connection conn=null;
    Statement stmt=null;
    try{
    conn=new dbcon(clg).getConnection(dept);
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from deptuploads where type like '"+type+"' order by sno desc");
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        Circular c=new Circular();
                       c.setName(rs.getString("name"));
                       c.setDesc(rs.getString("desc"));
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

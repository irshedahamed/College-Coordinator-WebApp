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

/**
 *
 * @author Home
 */
public class Exam {
     public static List<Circular> getAll(){
    List<Circular> list = new ArrayList<Circular>();
    Connection conn=null;
         PreparedStatement stmt=null;
    try{
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.prepareStatement("select * from exam_circular  order by sno desc");
                    ResultSet rs=stmt.executeQuery();
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        Circular c=new Circular();
                       c.setName(rs.getString("file_name"));
                       c.setDesc(rs.getString("descp"));
                       c.setPath(rs.getString("location"));
                     
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

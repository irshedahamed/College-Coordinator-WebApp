/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Transport;

import Downloads.Downloadable;
import Forms.OutPass;
import General.Batch;
import static General.Batch.getAll;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class BoardingPoint {
    
    
    
    

    
    public static List<String> getAll(){
        
         List<String> Boardingpts=new ArrayList<String>();
           Connection conn=null;
    Statement stmt=null;
   
        try{
            
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from boardingpts order by name");
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                       String point=new String();
                       point=rs.getString("name");
                       Boardingpts.add(point);
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
        return Boardingpts;
    } 
    
    public static String getHTMLContent(){
        String res="";
        for(String point:getAll()){
            res+="<option value='"+point+"'>"+point+"</option>";
    }
    return res;
   
    }
    
    public static boolean add(String boardingpt){
     Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           String sql="insert into boardingpts values(null,'"+boardingpt+"')";
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

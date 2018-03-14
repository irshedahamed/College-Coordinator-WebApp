/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author aravind
 */
public class dbcon {
    
     static final Map<String,Connection> connectionPool;
     String clg="";
     static{
         connectionPool=new HashMap<String, Connection>();
     }
    public Connection getConnection(String dbname)
    {
        
    return getConnection(dbname,clg);
    }

    public Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
     }
    
    private static Connection getConnection(String dbname,String clg){
        
        Connection conn=connectionPool.get(clg+dbname);
          try { 
            if(conn==null || conn.isClosed()){
                 Class.forName("com.mysql.jdbc.Driver").newInstance();


                 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbname,"root","0909");
                 connectionPool.put(dbname+clg, conn);

                 }
        
        } catch (Exception ex) {
            Logger.getLogger(dbcon.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
        
        return conn;
    }
}

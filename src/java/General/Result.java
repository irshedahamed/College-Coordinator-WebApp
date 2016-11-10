/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

import com.action.Find;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Home
 */
public class Result {
    
    public static Boolean passed(String rollno,String sem,String exam){
    Boolean result=false;
    Connection conn=null;
    Statement stmt=null;
    try{
    conn=new dbcon().getConnection(Find.sdept(rollno));
    stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("SELECT MIN(CONVERT(model"+exam+",unsigned int)+CONVERT(cycle"+exam+",unsigned int)) as combined FROM marks_table where rollno='"+rollno+"' and sem like '"+sem+"'");
        if(rs.next())
        {
        int a=rs.getInt("combined");
        if(a<58)
            result=false;
        else
            result=true;
        }
    }catch(Exception e){e.printStackTrace();}finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                conn.close();
        } catch (SQLException ex) {
        ex.printStackTrace();
        }
    }
        return result;
    }
    
    public static int numSubFailed(String rollno,String sem,String exam){
    int fail=0;
    Connection conn=null;
    Statement stmt=null;
    try{
    conn=new dbcon().getConnection(Find.sdept(rollno));
    stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("SELECT (CONVERT(model"+exam+",unsigned int)+CONVERT(cycle"+exam+",unsigned int)) as combined FROM marks_table where rollno='"+rollno+"' and sem like '"+sem+"'");
        while(rs.next())
        {
        int a=rs.getInt("combined");
        if(a<58)
            fail++;
        
        }
    }catch(Exception e){e.printStackTrace();}finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                conn.close();
        } catch (SQLException ex) {
        ex.printStackTrace();
        }
    }
        return fail;
    }
}

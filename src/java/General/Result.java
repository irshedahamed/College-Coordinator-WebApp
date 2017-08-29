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
    
   /* public static Boolean passed(String rollno,String sem,String exam){
    Boolean result=false;
    Connection conn=null;
    Statement stmt=null;
    try{
    conn=new dbcon().getConnection(Find.sdept(rollno));
    stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("SELECT model"+exam+",cycle"+exam+",(CONVERT(model"+exam+",unsigned int)+CONVERT(cycle"+exam+",unsigned int)) as combined FROM marks_table where rollno='"+rollno+"' and sem like '"+sem+"'");
        if(rs.next())
        {
            if(rs.getString("cycle"+exam).equals("N")){
                if(rs.getString("model"+exam).equals("A"))
                    result=true;
                else if(Integer.parseInt(rs.getString("model"+exam))<45)
                { result=false;}
                else
                result=true;
           
                }
            else{
        int a=rs.getInt("combined");
        if(rs.getString("cycle"+exam).equals("A") && rs.getString("model"+exam).equals("A"))
            result=true;
        else if(a<58)
            result=false;
        else
            result=true;
            }
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
    }*/
    
    public static int numSubFailed(String rollno,String sem,String exam){
    int fail=0;
    Connection conn=null;
    Statement stmt=null;
    try{
    conn=new dbcon().getConnection(Find.sdept(rollno));
    stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("SELECT model"+exam+",cycle"+exam+",unit" +exam+" FROM marks_table where rollno like '"+rollno+"' and sem like '"+sem+"'");
        while(rs.next())
        {
           
           int a=Find.calculateTotal(rs.getString("model"+exam), rs.getString("cycle"+exam), rs.getString("unit"+exam));
           if(a<45)
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

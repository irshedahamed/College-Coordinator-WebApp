/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actor;

import Downloads.Circular;
import com.action.Find;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Home
 */
public class Councillor {

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getSec() {
        return sec;
    }

    public void setSec(String sec) {
        this.sec = sec;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getAcademicyr() {
        return academicyr;
    }

    public void setAcademicyr(String academicyr) {
        this.academicyr = academicyr;
    }

    public String getSemister() {
        return semister;
    }

    public void setSemister(String semister) {
        this.semister = semister;
    }
    String dept;
    String sec;
    String batch;
    String academicyr;
    String semister;
    public Councillor(){
         Connection conn=null;
    Statement stmt=null;
        try{
            
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from academicyr where current not like 'n'");
                    
                    rs.beforeFirst();
                    if(rs.next()){
              academicyr=rs.getString("year");
        semister=rs.getString("current");
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
        
    
    }
    public void getCouncillor(String id){
        Connection conn=null;
    Statement stmt=null;
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from councillor where academicyr='"+academicyr+"' and semister like '"+semister+"' and staffid like'"+id+"'");
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        dept=rs.getString("dept");
                        sec=rs.getString("sec");
                        batch=rs.getString("batch");
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
    return ;
    }
    
}

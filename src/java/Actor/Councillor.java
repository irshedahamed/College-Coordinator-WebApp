/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actor;

import Downloads.Circular;
import General.AcademicYear;
import com.action.Find;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
              academicyr=AcademicYear.getCurrentYear().getYear() ;
        semister=AcademicYear.getCurrentYear().getCurrent();
 
    
    }
    public void getCouncillor(String id){
        Connection conn=null;
   // Statement stmt=null;
        PreparedStatement stmt=null;
   try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
   // stmt = conn.createStatement();
   stmt=conn.prepareStatement("select * from councillor where academicyr=? and semister like ? and staffid like ? ");
   stmt.setString(1, academicyr);
   stmt.setString(2, semister);
   stmt.setString(3, id);
   ResultSet rs=stmt.executeQuery();
                    
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
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
    return ;
    }
    
}

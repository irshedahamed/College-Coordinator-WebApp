/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Irshed
 */
public class WorkingTiming {
    
    private String sem;
    private String dept;
    private String timing;
    private String date;
    private String batch;

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getSem() {
        return sem;
    }

    public void setSem(String sem) {
        this.sem = sem;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getTiming() {
        return timing;
    }

    public void setTiming(String timing) {
        this.timing = timing;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    public static boolean checkDate(String date , String batch , String dept)
    {
        boolean result=false ;
        try {
            Connection con = null;
            PreparedStatement st = null;
            
            con = new dbcon().getConnection("sjitportal");
            st = con.prepareStatement("select * from working_timing where date like ? and batch like ? and dept like ? ");
            st.setString(1, date);
            st.setString(2, batch);
            st.setString(3, dept);
                    
            
            ResultSet rs = st.executeQuery();
            
            while(rs.next())
            {
                result = true;
            
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(WorkingTiming.class.getName()).log(Level.SEVERE, null, ex);
        }

    
    return result;
    }
    
    public static String insertTiming(WorkingTiming wrk)
    {
        try {
            Connection con = null;
            con = new dbcon().getConnection("sjitportal");
            PreparedStatement st
                    = con.prepareStatement("insert into working_timing values(?,?,?,?,?)");
            st.setString(1, wrk.getSem());
            st.setString(2, wrk.getBatch());
            st.setString(3, wrk.getDept());
            st.setString(4, wrk.getDate());
            st.setString(5, wrk.getTiming());
            st.executeUpdate();
            return "Added";
            
        } catch (SQLException ex) {
            Logger.getLogger(WorkingTiming.class.getName()).log(Level.SEVERE, null, ex);
            return "error";
        }
        
    }
    
}

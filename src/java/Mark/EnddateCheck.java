/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mark;

import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author santhosh
 */
public class EnddateCheck {
 private String dept;
 private String batch;
 private String sem;
 private String type;
 private String enddate;

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }
 
    public String insertOrUpdateDate(String dept, EnddateCheck a) throws SQLException {
        Connection con = new dbcon().getConnection("sjitportal");
        PreparedStatement st1 = null, st = null, st2 = null;
        try {
            if (!EnddateCheck.isDateAvailable(dept, a)) {
                String sql = "insert into exam_date values(?,?,?,?,?)";
                st = con.prepareStatement(sql);
                st.setString(1, a.getDept());
                st.setString(2, a.getBatch());
                st.setString(3, a.getSem());
                st.setString(4, a.getType());
                st.setString(5, a.getEnddate());
                st.executeUpdate();
                return "Updated";
            } else {
                String sql2 = "update exam_date set enddate=? where dept=? and batch=? and sem=? and type=?";
                st2 = con.prepareStatement(sql2);
                st2.setString(1, a.getEnddate());
                st2.setString(2, a.getDept());
                st2.setString(3, a.getBatch());
                st2.setString(4, a.getSem());
                st2.setString(5, a.getType());
                int i = st2.executeUpdate();
                if (i == 1) {
                    return "Updated";
                } else {
                    return "Not Updated";
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EnddateCheck.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ;//con.close();
            }
            if (st != null) {
                st.close();
            }
            if (st1 != null) {
                st1.close();
            }
            if (st2 != null) {
                st2.close();
            }
        }
        return "Not Updated";
    }
    public static boolean isDateAvailable(String dept, EnddateCheck m) throws SQLException {
        Connection con = new dbcon().getConnection("sjitportal");
        PreparedStatement st1 = null;
        try{    
        String sql1 = "select * from exam_date where dept=? and batch=? and sem=? and type=?";
            st1 = con.prepareStatement(sql1);
            st1.setString(1, m.getDept());
            st1.setString(2, m.getBatch());
            st1.setString(3, m.getSem());
            st1.setString(4, m.getType());
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                return true;
            }
        
    } catch (SQLException ex) {
            Logger.getLogger(EnddateCheck.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st1 != null) {
                st1.close();
            }
            if (con != null) {
                ;//con.close();
            }
        }
        return false;
    }
}


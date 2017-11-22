/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Subjects;

import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Irshed
 */
public class Subjects {

    private String subcode;
    private String regulation;
    private String subname;
    private String sem;
    private String subtype;
    private String ayear;

    public String getSubcode() {
        return subcode;
    }

    public void setSubcode(String subcode) {
        this.subcode = subcode;
    }

    public String getRegulation() {
        return regulation;
    }

    public void setRegulation(String regulation) {
        this.regulation = regulation;
    }

    public String getSubname() {
        return subname;
    }

    public void setSubname(String subname) {
        this.subname = subname;
    }

    public String getSem() {
        return sem;
    }

    public void setSem(String sem) {
        this.sem = sem;
    }

    public String getSubtype() {
        return subtype;
    }

    public void setSubtype(String subtype) {
        this.subtype = subtype;
    }

    public String getAyear() {
        return ayear;
    }

    public void setAyear(String ayear) {
        this.ayear = ayear;
    }

    public static List<String> getTherorySubCode(String dept, Subjects s) throws SQLException {
        List<String> subcode = new ArrayList<String>();
        PreparedStatement st = null;
        Connection con = null;
        try {
            con = new dbcon().getConnection(dept);
            String sql1 = "select * from subject_sem_table where regulation=? and sem=? and (ayear like ? or ayear like 'all')  and subtype='theory' order by subcode";
            st = con.prepareStatement(sql1);
            st.setString(1, s.getRegulation());
            st.setString(2, s.getSem());
             st.setString(3, "%elective%"+s.getAyear()+"%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                subcode.add(rs.getString("subcode"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Subjects.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
            if (con != null) {
                ;//con.close();
            }
        }
        return subcode;
    }
public static List<String> getLabSubCode(String dept, Subjects s) throws SQLException {
        List<String> subcode = new ArrayList<String>();
        PreparedStatement st = null;
        Connection con = null;
        try {
            con = new dbcon().getConnection(dept);
            String sql1 = "select * from subject_sem_table where regulation=? and sem=? and (ayear like ? or ayear like 'all')  and subtype='lab' order by subcode";
            st = con.prepareStatement(sql1);
            st.setString(1, s.getRegulation());
            st.setString(2, s.getSem());
             st.setString(3, "%elective%"+s.getAyear()+"%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                subcode.add(rs.getString("subcode"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Subjects.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
            if (con != null) {
                ;//con.close();
            }
        }
        return subcode;
    }

       
    public static Subjects getBySubcode(String dept, String subcode) throws SQLException {
        PreparedStatement st = null;
        Connection con = null;
        Subjects s = new Subjects();
        try {
            con = new dbcon().getConnection(dept);
            String sql = "select * from subject_sem_table where subcode=?";
            st = con.prepareStatement(sql);
            st.setString(1, subcode);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                s.setSubcode(subcode);
                s.setSem(rs.getString("sem"));
                s.setAyear(rs.getString("ayear"));
                s.setRegulation(rs.getString("regulation"));
                s.setSubname(rs.getString("subname"));
                s.setSubtype(rs.getString("subtype"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Subjects.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            if (st != null) {
                st.close();
            }
            if (con != null) {
                ;//con.close();
            }
        }
        return s;
    }
}

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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Home
 */
public class Batch {

    private String batch;
    private String regulation;
    private String status;
private String clg;
//public Batch(){
    
//}
public Batch(String clg){
    this.clg=clg;
}  
public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getRegulation() {
        return regulation;
    }

    public void setRegulation(String regulation) {
        this.regulation = regulation;
    }

    public static Batch getByYrIncharge(String id,String clg) {
        Batch b = new Batch(clg);
        Connection conbatch = null;
        Statement stmt = null;
        try {
            conbatch = new dbcon(clg).getConnection("portal");
            stmt = conbatch.createStatement();
            ResultSet rs = stmt.executeQuery("select * from regulations where batch in (select batch from yearincharge where id='" + id + "')");

            rs.beforeFirst();
            if (rs.next()) {
                b = new Batch(clg);
                b.setBatch(rs.getString("batch"));
                b.setRegulation(rs.getString("regulation"));
                b.setStatus(rs.getString("status"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conbatch != null) {
                    ;//conbatch.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(Batch.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return b;

    }

    public static List<Batch> getAll(String clg) {

        List<Batch> batch = new ArrayList<Batch>();
        Connection conbatch = null;
        Statement stmt = null;
        try {
            conbatch = new dbcon(clg).getConnection("portal");
            stmt = conbatch.createStatement();
            ResultSet rs = stmt.executeQuery("select * from regulations");

            rs.beforeFirst();
            while (rs.next()) {
                Batch b = new Batch(clg);
                b.setBatch(rs.getString("batch"));
                b.setRegulation(rs.getString("regulation"));
                b.setStatus(rs.getString("status"));
                batch.add(b);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conbatch != null) {
                    ;//conbatch.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(Batch.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return batch;
    }

    public static String getHTMLContent(String clg) {
        String res = "";
        for (Batch b : getAll(clg)) {
            if (b.getStatus().equals("Alumni") || b.getStatus().equals("New")) {
                res += "<option value='" + b.getBatch() + "'>" + b.getBatch() + "(" + b.getStatus() + ")" + "</option>";
            } else {
                res = "<option value='" + b.getBatch() + "'>" + b.getBatch() + "(" + b.getStatus() + " Year)" + "</option>" + res;
            }
        }
        return res;
    }

    public static String getRegulation(String batch,String clg) throws SQLException {
        String regulation = null;
        Connection con = new dbcon(clg).getConnection("portal");
        PreparedStatement st = null;
        try {
            String sql = "select * from regulations where batch=?";
            st = con.prepareStatement(sql);
            st.setString(1, batch);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                regulation = rs.getString("regulation");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Batch.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
            if (con != null) {
                ;//con.close();
            }
        }
        return regulation;
    }
    public static String getRegulationHTMLContent(String clg) {
        String res = "";
        for (Batch b : getAll(clg)) {
            res += "<option value='" + b.getRegulation() + "'>" + b.getRegulation() + "</option>";
        }
        return res;
   }
}

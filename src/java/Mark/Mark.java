/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mark;

import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Irshed
 */
public class Mark {

    private String rollno;
    private String subcode;
    private String type;
    private String mark;

    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getSubcode() {
        return subcode;
    }

    public void setSubcode(String subcode) {
        this.subcode = subcode;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String insertMarks(String dept, Mark m) throws SQLException {
        Connection con = new dbcon().getConnection(dept);
        PreparedStatement st = null;
        try {
            String sql = "insert into mark values(?,?,?,?)";
            st = con.prepareStatement(sql);
            st.setString(1, m.getRollno());
            st.setString(2, m.getSubcode());
            st.setString(3, m.getType());
            st.setString(4, m.getMark());
            st.executeUpdate();
            return "Updated";
        } catch (SQLException ex) {
            Logger.getLogger(Mark.class.getName()).log(Level.SEVERE, null, ex);
            return "Not Updated";
        } finally {
            if (con != null) {
                con.close();
            }
            if (st != null) {
                st.close();
            }

        }
    }
}

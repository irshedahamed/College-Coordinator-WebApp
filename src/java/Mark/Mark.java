/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mark;

import com.action.Find;
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
public class Mark {

//    static boolean isDateAvailable(String dept, EnddateCheck m) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }

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

    public String insertOrUpdateMarks(String dept, Mark m) throws SQLException {
        Connection con = new dbcon().getConnection(dept);
        PreparedStatement st1 = null, st = null, st2 = null;
        try {
            if (!Mark.isMarkAvailable(dept, m)) {
                String sql = "insert into marks values(?,?,?,?)";
                st = con.prepareStatement(sql);
                st.setString(1, m.getRollno());
                st.setString(2, m.getSubcode());
                st.setString(3, m.getType());
                st.setString(4, m.getMark());
                st.executeUpdate();
                return "Updated";
            } else {
                String sql2 = "update marks set mark=? where rollno=? and subcode=? and type=?";
                st2 = con.prepareStatement(sql2);
                st2.setString(1, m.getMark());
                st2.setString(2, m.getRollno());
                st2.setString(3, m.getSubcode());
                st2.setString(4, m.getType());
                int i = st2.executeUpdate();
                if (i == 1) {
                    return "Updated";
                } else {
                    return "Not Updated";
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Mark.class.getName()).log(Level.SEVERE, null, ex);
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

    public  void fetchMark(){
        try {
            this.setMark(getUserMark("", this ).getMark());
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    public static Mark getUserMark(String dept, Mark m) throws SQLException {
        Connection con = new dbcon().getConnection(Find.sdept(m.getRollno()));
        PreparedStatement st1 = null;
        try {
            String sql1 = "select * from marks where rollno=? and subcode=? and type=? ";
            st1 = con.prepareStatement(sql1);
            st1.setString(1, m.getRollno());
            st1.setString(2, m.getSubcode());
            st1.setString(3, m.getType());
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                m.setMark(rs.getString("mark"));
            }else{
                m.setMark(null);
            }
                
        } catch (SQLException ex) {
            Logger.getLogger(Mark.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st1 != null) {
                st1.close();
            }
            if (con != null) {
                ;//con.close();
            }
        }
        return m;
    }

    public static boolean isMarkAvailable(String dept, Mark m) throws SQLException {
        Connection con = new dbcon().getConnection(dept);
        PreparedStatement st1 = null;
        try {
            String sql1 = "select * from marks where rollno=? and subcode=? and type=? ";
            st1 = con.prepareStatement(sql1);
            st1.setString(1, m.getRollno());
            st1.setString(2, m.getSubcode());
            st1.setString(3, m.getType());
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Mark.class.getName()).log(Level.SEVERE, null, ex);
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

    public static List<Mark> getExamMark(String dept, Mark m) throws SQLException {
        List<Mark> list = new ArrayList<Mark>();
        Connection con = new dbcon().getConnection(Find.sdept(m.getRollno()));
        PreparedStatement st1 = null;
        try {
            String sql1 = "select * from marks where rollno=? and subcode=? ";
            st1 = con.prepareStatement(sql1);
            st1.setString(1, m.getRollno());
            st1.setString(2, m.getSubcode());
            ResultSet rs = st1.executeQuery();
            while(rs.next()) {
                Mark mi = new Mark();
                mi.setRollno(m.getRollno());
                mi.setSubcode(rs.getString("subcode"));
                mi.setType(rs.getString("type"));
                mi.setMark(rs.getString("mark"));
                list.add(mi);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Mark.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st1 != null) {
                st1.close();
            }
            if (con != null) {
                ;//con.close();
            }
        }
        return list;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Downloads;

import com.action.Base;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Home
 */
public class Notes extends Downloadable{
    
    private String academicyr;
    private String sem;
    private String subcode;
    private String type;
    private String by;
    private String time;
    private String subCategory;

    public String getAcademicyr() {
        return academicyr;
    }

    public void setAcademicyr(String academicyr) {
        this.academicyr = academicyr;
    }

    public String getSem() {
        return sem;
    }

    public void setSem(String sem) {
        this.sem = sem;
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
    
    
       public static List<Notes> getAll(String dept,Notes n){
    List<Notes> list = new ArrayList<Notes>();
    Connection conn=null;
           PreparedStatement stmt=null;
    try{
    conn=new dbcon().getConnection(dept);
    
     String path = Base.path+"/notes/"+n.getAcademicyr()+"/"+dept+"/"+"%"+"/"+n.getSem()+"/"+n.getSubcode()+"/"+n.getType()+"/";
                    stmt = conn.prepareStatement("select * from notes where path like ?");
                    stmt.setString(1, path);
                    ResultSet rs=stmt.executeQuery();
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        Notes note=new Notes();
                     note.setAcademicyr(rs.getString("acadamic_yr"));
                     note.setDesc(rs.getString("descp"));
                     note.setName(rs.getString("filename"));
                     note.setPath(rs.getString("path"));
                     note.setSem(rs.getString("sem"));
                     note.setSubcode(rs.getString("subcode"));
                     note.setType(rs.getString("notes_type"));
                     note.setBy(rs.getString("by"));
                     note.setTime(rs.getString("time"));
                     note.setSubCategory(rs.getString("subCategory"));
                       list.add(note);
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
    return list;
    }

    public String getBy() {
        return by;
    }

    public void setBy(String by) {
        this.by = by;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getSubCategory() {
        return subCategory;
    }

    public void setSubCategory(String subCategory) {
        this.subCategory = subCategory;
    }
}

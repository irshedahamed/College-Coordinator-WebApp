/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actor;

import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class Student {
    String id;
    String name;
    String dept;
    String sec;
    String batch;
    String regno;
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

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

    public String getRegno() {
        return regno;
    }

    public void setRegno(String regno) {
        this.regno = regno;
    }
    
    
    public static List<Student> getAll(String dept,String batch,String sec){
        
               Connection conn=null;
    Statement stmt=null;
    List<Student> list=new ArrayList<Student>();
        try{
            
    conn=new dbcon().getConnection(dept);
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from student_personal where batch like '"+batch+"' "
                            + "and sec like '"+sec+"'");
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        Student s=new Student();
                        s.setBatch(rs.getString("batch"));
                        s.setDept(rs.getString("dept"));
                        s.setRegno(rs.getString("regno"));
                        s.setName(rs.getString("name"));
                        s.setId(rs.getString("rollno"));
                        s.setSec(rs.getString("sec"));
                        list.add(s);
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
        
    
    return list;
    }
}

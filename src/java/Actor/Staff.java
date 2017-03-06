/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actor;

import com.action.Find;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Lenovo
 */
public class Staff {
 
    String id;
    String name;
    String desg;
    String sex;
    String mobile;
    String email;

    public String getId() {
        return id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesg() {
        return desg;
    }

    public void setDesg(String desg) {
        this.desg = desg;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    Councillor councillor;
    
    public Staff(String id){
    
        this.id=id;
    }
    
    public  Councillor getCouncillorDetails(){
        if(councillor==null){
        councillor=new Councillor();
        councillor.getCouncillor(id);
        }
    return councillor; 
    }
    
    public static Staff getByid(String id){
    Staff s=null;
    
         Connection conn=null;
    Statement stmt=null;
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from staff_general where staffid like '"+id+"'");
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        s=new Staff(rs.getString("staffid"));
                        s.setName(rs.getString("tittle")+rs.getString("name").toUpperCase());
                        s.setSex(rs.getString("gender"));
                        s.setDesg(rs.getString("desg"));
                        s.setEmail(rs.getString("email"));
                        s.setMobile(rs.getString("mobile1"));
                        
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
        
    
        return s;
    }
    
}

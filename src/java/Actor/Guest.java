/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actor;

import Downloads.Circular;
import com.action.Base;
import com.action.Find;
import dbconnection.dbcon;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author Home
 */
public class Guest {
    
    String id;
    String name;
    String city;
    String mobile;
    String mail;
    String address;
    String meet;
    String reason;
    String sex;
    String numpeople;

    public String getNumpeople() {
        return numpeople;
    }

    public void setNumpeople(String numpeople) {
        this.numpeople = numpeople;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

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

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMeet() {
        return meet;
    }

    public void setMeet(String meet) {
        this.meet = meet;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
    
    
    public boolean insert(String Category,String path){
    Connection conn=null;
    Statement stmt=null;
   String previd=null;
   id=Category+Find.getDate();
   
    
    try{
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.createStatement();
    String id;
                    ResultSet rs=stmt.executeQuery("select * from guest where id like '"+this.id+"%'");
                    
                    rs.afterLast();
                    if(rs.previous()){
                     previd=rs.getString("id");
                    }
                    
                    if(previd==null)
                        this.id+="001";
                    else{
                        id=previd.substring(previd.length()-3, previd.length());
                        id=String.valueOf(Integer.valueOf(id)+1);
                      
                        while(id.length()<3)
                        id+="0"+id;
                        
                        this.id=this.id+id;
                    }
                    
                    stmt.execute("insert into guest values('"+this.id+"','"+name+"','"+city+"','"+mobile+"','"+mail+"','"+address+"','"+reason
                    +"','"+meet+"','"+sex+"','+"+numpeople+"')");
                    
   
                   
                return true;
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

        return false;
    }
    
    public static Guest getById(String gid){
        Guest g=new  Guest();
        
        
          Connection conn=null;
        PreparedStatement    stmt=null;
   String previd=null;
   
   
    
    try{
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.prepareStatement("select * from guest where id like ?");
    stmt.setString(1, gid);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    if(rs.next()){
                     g.setId(rs.getString("id"));
                     g.setAddress(rs.getString("address"));
                     g.setCity(rs.getString("city"));
                     g.setReason(rs.getString("reason"));
                     g.setMeet(rs.getString("meet"));
                     g.setMail(rs.getString("mail"));
                     g.setMobile(rs.getString("mobile"));
                     g.setName(rs.getString("name"));
                     g.setSex(rs.getString("sex"));
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
    return g;
    }
    
    
     public static Guest getByMobile(String mobile){
        Guest g=new  Guest();
        
        
          Connection conn=null;
         PreparedStatement stmt=null;
   String previd=null;
   
   
    
    try{
    conn=new dbcon().getConnection("sjitportal");
    stmt = conn.prepareStatement("select * from guest where mobile like ?");
    stmt.setString(1, mobile);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    if(rs.next()){
                     g.setId(rs.getString("id"));
                     g.setAddress(rs.getString("address"));
                     g.setCity(rs.getString("city"));
                     g.setReason(rs.getString("reason"));
                     g.setMeet(rs.getString("meet"));
                     g.setMail(rs.getString("mail"));
                     g.setMobile(rs.getString("mobile"));
                     g.setName(rs.getString("name"));
                     g.setSex(rs.getString("sex"));
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
    return g;
    }
}

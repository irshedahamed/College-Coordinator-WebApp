/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actor;

import com.action.Find;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
    String doj;
    String add1;
    String add2;
    String city;
    String state;
    String pincode;
    String padd1;
    String padd2;
    String pcity;
    String pstate;
    String ppincode;
    String mobile1;
    String mobile2;
    String ll;
    public String getId() {
        return id;
    }


    public String getName() {
        return name;
    }
    public String getPstate() {
        return pstate;
    }

    public void setPstate(String pstate) {
        this.pstate = pstate;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDoj() {
        return doj;
    }

    public void setDoj(String doj) {
        this.doj = doj;
    }
    public String getPadd1() {
        return padd1;
    }

    public void setPadd1(String padd1) {
        this.padd1 = padd1;
    }
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }
    public String getPpincode() {
        return ppincode;
    }

    public void setPpincode(String ppincode) {
        this.ppincode = ppincode;
    }
    public String getAdd1() {
        return add1;
    }

    public void setAdd1(String add1) {
        this.add1 = add1;
    }
    public String getPadd2() {
        return padd2;
    }

    public void setPadd2(String padd2) {
        this.padd2 = padd2;
    }
    public String getAdd2() {
        return add2;
    }

    public void setAdd2(String add2) {
        this.add2 = add2;
    }
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    public String getPcity() {
        return pcity;
    }

    public void setPcity(String pcity) {
        this.pcity = pcity;
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
    
    public String getMobile1() {
        return mobile1;
    }

    public void setMobile1(String mobile1) {
        this.mobile1 = mobile1;
    }
    public String getMobile2() {
        return mobile2;
    }

    public void setMobile2(String mobile2) {
        this.mobile2 = mobile2;
    }
    public String getLl() {
        return ll;
    }

    public void setLl(String ll) {
        this.ll = ll;
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
        PreparedStatement stmt=null;
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from staff_general where staffid like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        s=new Staff(rs.getString("staffid"));
                        s.setName(rs.getString("tittle")+rs.getString("name").toUpperCase());
                        s.setSex(rs.getString("gender"));
                        s.setDesg(rs.getString("desg"));
                        s.setMobile(rs.getString("mobile1"));
                        s.setEmail(rs.getString("email"));                        
                        s.setDoj(rs.getString("doj"));
                        s.setAdd1(rs.getString("add1"));
                        s.setAdd2(rs.getString("add2"));
                        s.setCity(rs.getString("city"));
                        s.setState(rs.getString("state"));
                        s.setPincode(rs.getString("pincode"));
                        s.setPadd1(rs.getString("padd1"));
                        s.setPadd2(rs.getString("padd2"));
                        s.setPcity(rs.getString("pcity"));
                        s.setPstate(rs.getString("pstate"));
                        s.setPpincode(rs.getString("ppincode"));
                        s.setMobile1(rs.getString("mobile1"));
                        s.setMobile2(rs.getString("mobile2"));
                        s.setLl(rs.getString("ll"));
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
        
    
        return s;
    }
    
}

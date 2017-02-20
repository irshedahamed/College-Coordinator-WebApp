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
    String sex;
    String accomodation;

    public String getAccomodation() {
        return accomodation;
    }

    public void setAccomodation(String accomodation) {
        this.accomodation = accomodation;
    }

    
    public  class Admission{
    private String allotment;
    private String govt_mang;
    private String sport;
    private String scholarship;

        public String getAllotment() {
            return allotment;
        }

        public void setAllotment(String allotment) {
            this.allotment = allotment;
        }

        public String getGovt_mang() {
            return govt_mang;
        }

        public void setGovt_mang(String govt_mang) {
            this.govt_mang = govt_mang;
        }

        public String getSport() {
            return sport;
        }

        public void setSport(String sport) {
            this.sport = sport;
        }

        public String getScholarship() {
            return scholarship;
        }

        public void setScholarship(String scholarship) {
            this.scholarship = scholarship;
        }
    
   
 
    }
    
    public Admission admission;
    
    public void fetchAdmission(){
    admission=getAdmissionDetails();
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
    
    public boolean isHostel(){
    if(accomodation.equalsIgnoreCase("hostel"))
        return true;
    else
        return false;
    }
     public  Admission getAdmissionDetails(){
    
    
         
               Connection conn=null;
    Statement stmt=null;
   Admission a=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from student_admission_details where rollno like '"+id+"'");
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        a=new Admission();
                        a.setAllotment(rs.getString("adminallotment"));
                        a.setGovt_mang(rs.getString("govt_mang"));
                        a.setScholarship(rs.getString("scholarship"));
                        a.setSport(rs.getString("sports_admin"));
                        

                        
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
        
        
    return a;
    }
     
    public static List<Student> getAll(String dept,String batch,String sec){
        
               Connection conn=null;
    Statement stmt=null;
    List<Student> list=new ArrayList<Student>();
        try{
            
    conn=new dbcon().getConnection(dept);
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from student_personal where batch like '"+batch+"' "
                            + "and sec like '"+sec+"' order by CONVERT(regno,UNSIGNED)");
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        Student s=new Student();
                        s.setBatch(rs.getString("batch"));
                        s.setId(rs.getString("rollno"));
                        s.setDept(Find.sdept(s.getId()));
                        s.setRegno(rs.getString("regno"));
                        s.setName(rs.getString("name"));
                        s.setAccomodation(rs.getString("accomodation"));
                        s.setSec(rs.getString("sec"));
                        s.setSex(rs.getString("gender"));
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
    
      public static Student getById(String id){
        
               Connection conn=null;
    Statement stmt=null;
    Student s=new Student();
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from student_personal where rollno like '"+id+"'");
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        s.setBatch(rs.getString("batch"));
                        s.setDept(Find.sdept(id));
                        s.setRegno(rs.getString("regno"));
                        s.setName(rs.getString("name"));
                        s.setId(rs.getString("rollno"));
                        s.setSec(rs.getString("sec"));
                        s.setSex(rs.getString("gender"));
                        s.setAccomodation(rs.getString("accomodation"));
                       

                        
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

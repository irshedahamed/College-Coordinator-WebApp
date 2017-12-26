/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

import dbconnection.dbcon;
import java.sql.Connection;
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
public class AcademicYear {
    
    private String year;
    private String current;
    private String yearString;
private String clg;
//public AcademicYear(){
    
//}
public AcademicYear(String clg){
    this.clg=clg;
}
    public String getYearString() {
        return yearString;
    }

    public void setYearString(String yearString) {
        this.yearString = yearString;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getCurrent() {
        return current;
    }

    public void setCurrent(String current) {
        this.current = current;
    }
    
     public boolean insertYear(String YearString,String Year) throws SQLException
    {
        
        Connection con = null;
            Statement st = null;
            
            con = new dbcon(clg).getConnection("portal");
            st = con.createStatement();
           int i =   st.executeUpdate("insert into academicyr values('"+Year+"','"+YearString+"','n')");
            
              if(st!=null)
                            st.close();
                              if(con!=null)
                                ;//con.close();
        if(i==1)
        {return true;}
        else
        {return false;}
     }
    public boolean batchAssign(String Current,String Year) throws SQLException
    {
      
        Connection con = null;
            Statement st = null;
            
            con = new dbcon(clg).getConnection("portal");
            st = con.createStatement();
            
                  st.executeUpdate("update academicyr set current = 'n'");   
          
                  int i =   st.executeUpdate("update academicyr set current ='"+Current+"' where year ='"+Year+"' "); 
           
            if(st!=null)
                            st.close();
                              if(con!=null)
                                ;//con.close();
      if(i==1)
       return true;
      else
        return false;
      
    }
    public static List<AcademicYear> getAll(String clg){
    
        List<AcademicYear> list=new ArrayList<AcademicYear>();
        Connection conbatch=null;
        Statement stmt=null;
        try{
         conbatch = new dbcon(clg).getConnection("portal");
                     stmt = conbatch.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from academicyr");
                    
                    rs.afterLast();
                    while(rs.previous())
                    {
                   AcademicYear a=new AcademicYear(clg);
                   a.setCurrent(rs.getString("current"));
                   a.setYear(rs.getString("year"));
                   a.setYearString(rs.getString("yearString"));
                   list.add(a);
                    
                    }
        }catch(Exception e){
        e.printStackTrace();
        }
        finally{
            try {
                if(stmt!=null)
                    stmt.close();
                if(conbatch!=null)
                    ;//conbatch.close();
            } catch (SQLException ex) {
                Logger.getLogger(Batch.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return list;
    }
    
    
    
    public static AcademicYear getCurrentYear(String clg){
    
        
                   AcademicYear a=new AcademicYear(clg);
        Connection conbatch=null;
        Statement stmt=null;
        try{
         conbatch = new dbcon(clg).getConnection("portal");
                     stmt = conbatch.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from academicyr where current not like 'n'");
                    
                    rs.afterLast();
                    while(rs.previous())
                    {
                        if(!rs.getString("current").equals("fee")){
                   a.setCurrent(rs.getString("current"));
                   a.setYear(rs.getString("year"));
                   a.setYearString(rs.getString("yearString"));
                        }
                    
                    }
        }catch(Exception e){
        e.printStackTrace();
        }
        finally{
            try {
                if(stmt!=null)
                    stmt.close();
                if(conbatch!=null)
                    ;//conbatch.close();
            } catch (SQLException ex) {
                Logger.getLogger(Batch.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return a;
    }
    
    public static AcademicYear getFeeYear(String clg){
    
        
                   AcademicYear a=null;
        Connection conbatch=null;
        Statement stmt=null;
        try{
         conbatch = new dbcon(clg).getConnection("portal");
                     stmt = conbatch.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from academicyr where current not like 'n'");
                    
                    rs.afterLast();
                    while(rs.previous())
                    {
                   if(a==null || rs.getString("current").equals("fee"))
                   a=new AcademicYear(clg);
                   a.setCurrent(rs.getString("current"));
                   a.setYear(rs.getString("year"));
                   a.setYearString(rs.getString("yearString"));
                  
                    
                    }
        }catch(Exception e){
        e.printStackTrace();
        }
        finally{
            try {
                if(stmt!=null)
                    stmt.close();
                if(conbatch!=null)
                    ;//conbatch.close();
            } catch (SQLException ex) {
                Logger.getLogger(Batch.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return a;
    }
    
    public static String getHTMLContent(String clg){
    String res="";
        for(AcademicYear b:getAll(clg)){
            if(b.getCurrent().equals("n") ||b.getCurrent().equals("fee"))
            res+="<option value='"+b.getYear()+"'>"+b.getYearString()+"</option>";
            else
            res="<option value='"+b.getYear()+"'>"+b.getYearString()+"</option>"+res;
                
    }
    return res;
    }
}

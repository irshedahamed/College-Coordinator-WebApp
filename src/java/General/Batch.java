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
public class Batch {
    
    private String batch;
    private String regulation;

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
    
    public static List<Batch> getAll(){
    
        List<Batch> batch=new ArrayList<Batch>();
        Connection conbatch=null;
        Statement stmt=null;
        try{
         conbatch = new dbcon().getConnection("sjitportal");
                     stmt = conbatch.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from regulations");
                    
                    rs.beforeFirst();
                    while(rs.next())
                    {
                    Batch b=new Batch();
                    b.setBatch(rs.getString("batch"));
                    b.setRegulation(rs.getString("regulation"));
                    batch.add(b);
                    
                    }
        }catch(Exception e){
        e.printStackTrace();
        }
        finally{
            try {
                if(stmt!=null)
                    stmt.close();
                if(conbatch!=null)
                    conbatch.close();
            } catch (SQLException ex) {
                Logger.getLogger(Batch.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return batch;
    }
    
    public static String getHTMLContent(){
    String res="";
        for(Batch b:getAll()){
            res+="<option value='"+b.getBatch()+"'>"+b.getBatch()+"</option>";
    }
    return res;
    }
}

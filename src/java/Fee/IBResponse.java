/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Home
 */
public class IBResponse {

private String rollno;
private String mup;
private String journalno;
private String txndate;
private String status;

    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getMup() {
        return mup;
    }

    public void setMup(String mup) {
        this.mup = mup;
    }

    public String getJournalno() {
        return journalno;
    }

    public void setJournalno(String journalno) {
        this.journalno = journalno;
    }

    public String getTxndate() {
        return txndate;
    }

    public void setTxndate(String txndate) {
        this.txndate = txndate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

public boolean insert(){
Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           
           String sql;
           sql="insert into ibresponse values('"+rollno+"','"+mup+"','"+journalno+"','"+txndate+"','"+status+"')";
           
       update+=stmt.executeUpdate(sql);
       
     
       
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
       if(update==1)
           return true;
       else
           return false;
    }
 public static Map<MUResponse,IBResponse> fetchby(List<MUResponse> mup,String From,String To) 
    {
        Map<MUResponse,IBResponse> map = new HashMap<MUResponse, IBResponse>();
      try{  
        Connection con = null;
        Statement st = null;
        
        con = new dbcon().getConnection("sjitportal");
        
        st = con.createStatement();
       
        for(MUResponse mu:mup){
        ResultSet rs = st.executeQuery("Select * from ibresponse where mup = '"+mu.getRefno()+"' and status='Y'");

        
         rs.afterLast();
         
         if (rs.previous())
        {
          
            IBResponse i=new IBResponse();
            i.setMup(rs.getString("mup"));
            i.setRollno(rs.getString("rollno"));
            i.setStatus(rs.getString("status"));
            i.setJournalno(rs.getString("journalno"));
            i.setTxndate(rs.getString("txndate"));
           
     
     String[] t = i.getTxndate().split(" ");
     
      Date txndate = new SimpleDateFormat("dd/MM/yyyy").parse(t[0]);
      Date FromDate = new SimpleDateFormat("yyyy-MM-dd").parse(From);
      Date ToDate = new SimpleDateFormat("yyyy-MM-dd").parse(To);
      
      if(txndate.compareTo(FromDate) >= 0 && txndate.compareTo(ToDate) <= 0)
      {
    
      map.put(mu, i);
      }
      
         }
         rs.close();
        }
                     
        if(st!=null)
                st.close();
            if(con!=null)
                con.close();
           
      }catch(Exception e){
    e.printStackTrace();
    }
      
      return map;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import Actor.Student;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Home
 */
public class MUResponse {

    
    private String utilitycode;
    private String rollno;
    private String acyear;


    private String refno;
    private String status;
    private String bankchrge;
    private String totalamt;
    private String refdate;
    private String merchantrefno;
    private String msg;
    private String handleID;
    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getAcyear() {
        return acyear;
    }

    public void setAcyear(String acyear) {
        this.acyear = acyear;
    }
    public String getUtilitycode() {
        return utilitycode;
    }

    public void setUtilitycode(String utilitycode) {
        this.utilitycode = utilitycode;
    }

    public String getRefno() {
        return refno;
    }

    public void setRefno(String refno) {
        this.refno = refno;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBankchrge() {
        return bankchrge;
    }

    public void setBankchrge(String bankchrge) {
        this.bankchrge = bankchrge;
    }

    public String getTotalamt() {
        return totalamt;
    }

    public void setTotalamt(String totalamt) {
        this.totalamt = totalamt;
    }

    public String getRefdate() {
        return refdate;
    }

    public void setRefdate(String refdate) {
        this.refdate = refdate;
    }

    public String getMerchantrefno() {
        return merchantrefno;
    }

    public void setMerchantrefno(String merchantrefno) {
        this.merchantrefno = merchantrefno;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getHandleID() {
        return handleID;
    }

    public void setHandleID(String handleID) {
        this.handleID = handleID;
    }
    
    public boolean insert(){
    Connection conn=null;
       Statement stmt=null;
       int update=0;
       try{
           conn=new dbcon().getConnection("sjitportal");
           stmt=conn.createStatement();
           
           String sql;
           sql="insert into bank_mup values(null,'"+rollno+"','"+acyear
                   +"','"+refno+"','"+bankchrge+"','"+utilitycode+"','"+status+"','"+totalamt+
                   "','"+merchantrefno+"','"+msg+"','"+handleID+"')";
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
    public static ArrayList<MUResponse> fetchby(String acyear)
    {
        ArrayList<MUResponse> List =  new ArrayList<MUResponse>();
      try{  
        Connection con = null;
        Statement st = null;
        
        con = new dbcon().getConnection("sjitportal");
        
        st = con.createStatement();
        
        ResultSet rs = st.executeQuery("Select * from bank_mup where acyear = '"+acyear+"'");
        
         rs.beforeFirst();
         
         while (rs.next())
        {
            MUResponse m = new MUResponse();
            m.setRefno(rs.getString("mup"));
            m.setRollno(rs.getString("rollno"));
            m.setTotalamt(rs.getString("totalamt"));
            m.setBankchrge(rs.getString("bankchrg"));
            m.setHandleID(rs.getString("handleid"));
            m.setUtilitycode(rs.getString("utilitycode"));
            m.setMsg(rs.getString("msg"));
            
            List.add(m);
         }
                     
        if(st!=null)
                st.close();
            if(con!=null)
                con.close();
           
      }catch(Exception e){
    e.printStackTrace();
    }
    
       
      return List;
    
    }

}
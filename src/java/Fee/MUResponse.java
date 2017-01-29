/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

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
}

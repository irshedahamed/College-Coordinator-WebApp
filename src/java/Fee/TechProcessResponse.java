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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javafx.scene.chart.PieChart;

/**
 *
 * @author Home
 */
public class TechProcessResponse {
    private String rollno;
    private String user;
    private String refno;
    private String amount;
    private String status;
    private String msg;
    private String err_msg;
    private String clnt_txn_ref;
    private String tpsl_bank_cd;
    private String rqst_token;
    private String tpsl_txn_id;
    private String time;
    private String bal_amount;

    public String getBal_amount() {
        return bal_amount;
    }

    public void setBal_amount(String bal_amount) {
        this.bal_amount = bal_amount;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTpsl_txn_id() {
        return tpsl_txn_id;
    }

    public void setTpsl_txn_id(String tpsl_txn_id) {
        this.tpsl_txn_id = tpsl_txn_id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getErr_msg() {
        return err_msg;
    }

    public void setErr_msg(String err_msg) {
        this.err_msg = err_msg;
    }

    public String getClnt_txn_ref() {
        return clnt_txn_ref;
    }

    public void setClnt_txn_ref(String clnt_txn_ref) {
        this.clnt_txn_ref = clnt_txn_ref;
    }

    public String getTpsl_bank_cd() {
        return tpsl_bank_cd;
    }

    public void setTpsl_bank_cd(String tpsl_bank_cd) {
        this.tpsl_bank_cd = tpsl_bank_cd;
    }

    public String getRqst_token() {
        return rqst_token;
    }

    public void setRqst_token(String rqst_token) {
        this.rqst_token = rqst_token;
    }
    

    
    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getRefno() {
        return refno;
    }

    public void setRefno(String refno) {
        this.refno = refno;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
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
           sql="insert into techprocess values('"+rollno+"','"+refno+"','"+status+
                   "','"+msg+"','"+err_msg+"','"+clnt_txn_ref+"','"+tpsl_bank_cd+
                   "','"+tpsl_txn_id+"','"+amount+"','"+time+"','"+bal_amount+"','"+rqst_token+"','"+user+"')";
       update+=stmt.executeUpdate(sql);
       
     
       
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
       if(update==1)
           return true;
       else
           return false;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
    
    public void setFromResMsg(String resMsg,TechProcess tp){
        
       String[] splitres=resMsg.split("\\|");
       setUser(tp.getUser());
       setRollno(tp.getCustID());
       setRefno(tp.getRefno());
       setStatus(splitres[0].split("=")[1]);
       setMsg(splitres[1].split("=")[1]);
       setErr_msg(splitres[2].split("=")[1]);
       setClnt_txn_ref(splitres[3].split("=")[1]);
       setTpsl_bank_cd(splitres[4].split("=")[1]);
       setTpsl_txn_id(splitres[5].split("=")[1]);
       setAmount(splitres[6].split("=")[1]);
       setTime(splitres[7].split("=")[1]);
       setBal_amount(splitres[9].split("=")[1]);
       setRqst_token(splitres[10].split("=")[1]);
    
    }
    public static List<TechProcessResponse> fetchby(List<MUResponse> mup,String From,String To)
    {
        List<TechProcessResponse> list = new ArrayList<TechProcessResponse>();
      try{  
        Connection con = null;
        Statement st = null;
        
        con = new dbcon().getConnection("sjitportal");
        
        st = con.createStatement();
        for(MUResponse mu:mup){
           
        ResultSet rs = st.executeQuery("Select * from techprocess where mupno = '"+mu.getRefno()+"' and status like '0300'");
        
         rs.afterLast();
         if (rs.previous())
        {
            TechProcessResponse m=new TechProcessResponse();
            m.setRefno(rs.getString("mupno"));
            m.setRollno(rs.getString("clientid"));
            m.setTime(rs.getString("time"));
            m.setAmount(rs.getString("txn_amount"));
            
            Date d=new SimpleDateFormat("dd-MM-yyyy").parse((m.getTime().split(" ")[0]));
            
            if(d.compareTo(new SimpleDateFormat("yyyy-MM-dd").parse(From))>=0 && d.compareTo(new SimpleDateFormat("yyyy-MM-dd").parse(To))<=0 )
            list.add(m);
        }
         rs.close();
        }
        if(st!=null)
                st.close();
            if(con!=null)
                ;//con.close();
           
      }catch(Exception e){
    e.printStackTrace();
    }
    
       
      return list;
    
    }
}

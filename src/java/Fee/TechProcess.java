/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import com.tp.pg.util.TransactionRequestBean;
import com.tp.pg.util.TransactionResponseBean;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Home
 */
public class TechProcess {
    
    static{
    Connection conn=null;
         Statement stmt=null;
         try{
         conn=new dbcon().getConnection("sjitportal");
         stmt=conn.createStatement();
         String sql="select value from credentials where ckey like 'TPencKey'";
         ResultSet rs=stmt.executeQuery(sql);
         rs.next();
         encKey=rs.getString("value");
         rs.close();
         sql="select value from credentials where ckey = 'TPIV'";
         rs=stmt.executeQuery(sql);
         rs.next();
         IV=rs.getString("value");
         rs.close();
         }
         catch(Exception e){
         e.printStackTrace();
         }finally{
             try {
                 if(stmt!=null)
                     stmt.close();
                 if(conn!=null)
                     conn.close();
             } catch (Exception ex) {
             ex.printStackTrace();
             }
         }
    }
  
   private static String merchantCode="L2857";
   private String refno;
   private String user;
   private String amount;
   private static String curCode="INR";
   private String ReturnURL;
   private String APIReturnURL;
   private static String WebServiceLocator="https://www.tpsl-india.in/PaymentGateway/services/TransactionDetailsNew";
   private String CustID;
   private static String encKey;
   private static String IV;
   private TransactionRequestBean  reqBean;
   private static TransactionResponseBean resBean; 

 
   
  
    

    public String getMerchantCode() {
        return merchantCode;
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

    public String getCurCode() {
        return curCode;
    }

     public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getReturnURL() {
        return ReturnURL;
    }

    public void setReturnURL(String ReturnURL) {
        this.ReturnURL = ReturnURL;
    }


    public String getWebServiceLocator() {
        return WebServiceLocator;
    }



    public String getCustID() {
        return CustID;
    }

    public void setCustID(String CustID) {
        this.CustID = CustID;
    }
    
    
    public String  getRedirectURL(){
        String URL;
        //amount="8";
        reqBean=new TransactionRequestBean();
        reqBean.setStrRequestType("T");
        reqBean.setStrMerchantCode(merchantCode);
        reqBean.setMerchantTxnRefNumber(refno);
        reqBean.setStrAmount(amount);
        reqBean.setTxnDate(com.action.Find.getFormattedDate());
        reqBean.setStrCurrencyCode("INR");
        reqBean.setStrReturnURL(ReturnURL);
        reqBean.setWebServiceLocator(WebServiceLocator);
        reqBean.setCustID(CustID);
        reqBean.setKey(encKey.getBytes());
        reqBean.setIv(IV.getBytes());
        reqBean.setTxnDate(com.action.Find.getFormattedDate());
        reqBean.setStrShoppingCartDetails(user+"_"+amount+"_0.0");
        URL=reqBean.getTransactionToken();
        
    return URL;
    }
    
    public static String getResponse(String msg){
        resBean=new TransactionResponseBean();
    resBean.setIv(IV.getBytes());
    resBean.setKey(encKey.getBytes());
    resBean.setResponsePayload(msg);
   
    return resBean.getResponsePayload();
    }
    
    public  String getTransactionStatus(String msg){
        System.out.println(msg);
        String message=getResponse(msg);
        System.out.println(message);
        String status=message.split("\\|")[1].split("=")[1];
        if(status.equals("success")){
        reqBean.setStrRequestType("S");
        String response=reqBean.getTransactionToken();
        System.err.print(response);
        return response;
        }
    return "failed T";
    }

    public String getAPIReturnURL() {
        return APIReturnURL;
    }

    public void setAPIReturnURL(String APIReturnURL) {
        this.APIReturnURL = APIReturnURL;
    }
}

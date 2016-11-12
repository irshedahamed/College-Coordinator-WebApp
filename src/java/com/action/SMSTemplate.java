/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import dbconnection.dbcon;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.HttpsURLConnection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

/**
 *
 * @author Home
 */
public class SMSTemplate {
   static boolean send(String number,String message){
         InputStream input = null;
            HttpURLConnection connection = null;
            int sent=0;
         Connection conn=null;
         Statement stmt=null;
         String user=null,pass=null;
         try{
         conn=new dbcon().getConnection("sjitportal");
         stmt=conn.createStatement();
         String sql="select value from credentials where ckey like 'smsuser'";
         ResultSet rs=stmt.executeQuery(sql);
         rs.next();
         user=rs.getString("value");
         rs.close();
         sql="select value from credentials where ckey = 'smspassword'";
         rs=stmt.executeQuery(sql);
         rs.next();
         pass=rs.getString("value");
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
        try {
               // number="9444902605";
                number.trim();
                message=message.replace(" ","%20");
              URL url =  new URL("http://smscenter.co.in/API/pushsms.aspx?loginID="+user+"&password="+pass+"&mobile="+number+"&text="+message+"&senderid=STJOSE&route_id=2&Unicode=0");
                
              
              
                
                
                connection = (HttpURLConnection) url.openConnection();
                connection.connect();
                input = connection.getInputStream();
                char c;
                String s = new String();
                while ((c = (char) input.read()) != (char) -1)
                    s += c;
                
               // System.out.println(s);
                Document doc=Jsoup.parse(s);
                Elements ele=doc.select("#Label5");
                if(ele.html().contains("sent")){
                sent=1;
                }
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                if(input!=null)
                    try {
                        input.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                if (connection != null)
                    connection.disconnect();
            }
        
        if(sent==1)
            return true;
        else
            return false;
    }
}

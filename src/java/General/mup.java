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
import static java.util.Collections.list;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Irshed
 */
public class mup {

    
    
    private String mup;

    public String getMup() {
        return mup;
    }

    public void setMup(String mup) {
        this.mup = mup;
    }
    
     public static List<mup> getAll(){
    
        
          List<mup>   pay = new ArrayList<mup>();
            Connection con=null;
            Connection con1 =null;
            
            Statement st=null;
            Statement st1=null;
         try {   
            con = new dbcon().getConnection("sjitportal");
            con1 = new dbcon().getConnection("sjitportal");
            st = con.createStatement();
            ResultSet rs=st.executeQuery("select mup from bank_mup");
            
            rs.beforeFirst();
            while(rs.next())
            {
                String mup1 = rs.getString("mup");
                st1 = con1.createStatement();
                ResultSet rs1 = st1.executeQuery("SELECT mup FROM ibresponse");
                
                rs1.beforeFirst();
                while(rs1.next())
                {
                    String mup2 = rs1.getString("mup");
                    if(mup1==mup2)
                    {
                        mup m = new mup();
                        m.setMup("mup2");
                        pay.add(m);
                    }
                }
                
            }
           if(st!=null)
                    st.close();
                if(con!=null)
                    con.close();
                if(st1!=null)
                    st1.close();
                if(con1!=null)
                    con1.close();
        } catch (SQLException ex) {
            Logger.getLogger(mup.class.getName()).log(Level.SEVERE, null, ex);
        }
 return pay;
}
     
}
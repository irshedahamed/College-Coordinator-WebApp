/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import dbconnection.dbcon;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JsonServlet extends HttpServlet {

        private static final long serialVersionUID = 1L;

        protected void doGet(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {

                try
                {
                    
                    String semester = request.getParameter("semester");
                    String department = request.getParameter("department");
                    String batch = request.getParameter("batch");
                    String ayear=request.getParameter("ayear");
                    String batch1=new StringBuffer(batch).reverse().toString();
                     Class.forName("com.mysql.jdbc.Driver").newInstance();
                       String clg = (String)request.getSession().getAttribute("clg");
      
                     Connection con = new dbcon(clg).getConnection("portal");
                    Statement st= con.createStatement();
                    String sql="select * from regulations where batch='"+batch+"'";
                    ResultSet rs= st.executeQuery(sql);
                    String regulation=null;
                    while(rs.next())
                    {
                        regulation=rs.getString("regulation");
                    }
                    rs.close();
                    st.close();
                    ;//con.close();
                    List<String> list = new ArrayList<String>();
                    String json = null;
                    
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con = new dbcon(clg).getConnection(department);
                        st = con.createStatement();
                        rs=st.executeQuery("select subcode,subname from subject_sem_table where sem='"+semester+"'and (ayear like '%elective%"+ayear+"%' or ayear like 'all') and subtype='theory' and regulation='"+regulation+"'");
                        while(rs.next())
                        {
                            String a=rs.getString("subname");
                            String b = rs.getString("subcode");
                            //String b=rs.getString("subcode");
                            list.add(b+"-"+a);
                        }
                        
                        
                        
                        
                        json = new Gson().toJson(list);
                        response.setContentType("application/json");
                        response.getWriter().write(json);
                     if(st!=null)
                            st.close();
                              if(con!=null)
                                ;//con.close();
                }catch(Exception ex)
        {
          
                Logger.getLogger(JsonServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        
            
        
}

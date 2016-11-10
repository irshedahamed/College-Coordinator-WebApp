<%-- 
    Document   : showoverallattendance
    Created on : Aug 21, 2015, 2:07:12 PM
    Author     : Divya Sri
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
       
    </head>
    <body><center>
        <table class="bordered">
            <tr>
                <th><center>S No.</center></th>
                <th><center>Date Absent</center></th>

        </tr>
            
            <%
            String id=request.getParameter("index");
            String deptname= session.getAttribute("deptname").toString();
            String rollno= session.getAttribute("username").toString();
            Connection con=new dbcon().getConnection(deptname);
            Connection con1= new dbcon().getConnection("sjitportal");
            Statement st = con.createStatement();
            Statement st1 = con1.createStatement();
            ResultSet rs1 = st.executeQuery("select * from overallattendence where sem='"+id+"' and rollno='"+rollno+"' ");
            int i =1;
            String date;
            while(rs1.next())
            {
                date = rs1.getString("date");
                
                
             %>
             <tr>
             <td><%=i%></td>
             <td><%=date%></td>
             
             </tr>
             <%
             i++;
            }
              if(st!=null)
                            st.close();
                              if(st1!=null)
                            st1.close();
                              if(con1!=null)
                                con1.close();
                              if(con!=null)
                                con.close();
            %>
            </table>
    </center>
    </body>
</html>


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
                <th><center>BATCH</center></th>
        <th><center>SEM</center></th>
<th><center>DEPARTMENT</center></th>
<th><center>SECTION</center></th>
<th><center>SUBJECT CODE</center></th>
<th><center>SUBJECT NAME</center></th>
        </tr>
            
            <%
           
            Connection con=new dbcon().getConnection("cse");
            Connection con1= new dbcon().getConnection("sjitportal");
            Statement st = con.createStatement();
            Statement st1 = con1.createStatement();
            ResultSet rs1 = st.executeQuery("select * from subject_allocation where staffid='"+id+"'");
            ResultSet rs2;
            String batch,subcode,subname=null,dept,sec,sem;
            while(rs1.next())
            {
                batch=rs1.getString("batch");
                sem=rs1.getString("sem");
                dept=rs1.getString("dept");
                subcode=rs1.getString("subcode");
                sec =rs1.getString("sec");
                rs2=st1.executeQuery("select subname from subject_table where subcode='"+subcode+"'");
                while(rs2.next())
                {
                    subname=rs2.getString("subname");
                }
             %>
             <tr>
             <td><%=batch%></td>
             <td><%=sem%></td>
             <td><%=dept%></td>
             <td><%=sec%></td>
             <td><%=subcode%></td>
             <td><%=subname%></td>
             </tr>
             <%
            }
            
            %>
            </table>
    </center>
    </body>
</html>
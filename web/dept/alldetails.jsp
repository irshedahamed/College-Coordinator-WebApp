<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <% 
   try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type1 ="";
    ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        while(rsss.next())
        {
            type1 = rsss.getString("type");
        }
        if(type1.equals("dept"))
        {
    
    
    %>

    <head>
        <title>Bootstrap Case</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="../css/tabledesign.css" rel="stylesheet">

    </head>
    <body>

        

           
                <%
                    String rollno = request.getParameter("rollno");
                    String batch="";
                    String sem = request.getParameter("sem");
                    
                    Connection con = new dbcon().getConnection(Find.dept(username));
                    Statement st1 = con.createStatement();
                    String name="";
                    ResultSet rs1= st1.executeQuery("select name from student_personal where rollno='"+rollno+"'");
                    String subname="",subcode="",cycle1="",cycle2="",cycle3="",model1="",model2="",model3="";
                   if(rs1.next())
                   {
                       name=rs1.getString("name");
                              
                   }
                       
                   
                    

                %>
                
                
    <center><h3>SEM <%=sem%></h3></center> 
                    
                    <center><table class="bordered"><tr>
                                <th>SUBCODE</th>
                                <th>SUBJECT NAME</th>
                                <th>CYCLE 1</th>
                                <th>MODEL 1</th>
                                <th>CYCLE 2</th>
                                <th>MODEL 2</th>
                                <th>CYCLE 3</th>
                                <th>MODEL 3</th>
                            </tr>
                            <%
                    try
                    {
                       
                    PreparedStatement st = con.prepareStatement("select marks_table.*,subject_sem_table.subname from marks_table,subject_sem_table where marks_table.subcode=subject_sem_table.subcode and marks_table.sem=? and rollno=?");
                    st.setString(2, rollno);
                    st.setString(1, sem);
                   
                    ResultSet rs= st.executeQuery();
                    while(rs.next())
                    {
                        subcode=rs.getString("subcode");
                        subname=rs.getString("subname");
                        cycle1=rs.getString("cycle1");
                        cycle2=rs.getString("cycle2");
                        cycle3=rs.getString("cycle3");
                        model1=rs.getString("model1");
                        model2=rs.getString("model2");
                        model3=rs.getString("model3");
                    
                    
                    %>
                            <tr>
                                <td><%=subcode%></td>
                                <td><%=subname%></td>
                                <td><%=cycle1%></td>
                                <td><%=model1%></td>
                                <td><%=cycle2%></td>
                                <td><%=model2%></td>
                                <td><%=cycle3%></td>
                                <td><%=model3%></td>
                            </tr>
                        <%
                    }
                    }catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                        
                        %>
                      
                        
                        </table></center>
                


    </body>
     <%
         
                            if(st1!=null)
                            st1.close();
                              if(con!=null)
                                con.close();
    }
        else
    {
        response.sendRedirect("../index.jsp");
    }
    }
    else
    {
        response.sendRedirect("../index.jsp");
    }

                            if(sttt!=null)
                            sttt.close();
                              if(connn!=null)
                                connn.close();
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
</html>

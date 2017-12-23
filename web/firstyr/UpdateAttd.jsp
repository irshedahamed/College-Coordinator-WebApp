<%-- 
    Document   : UpdateAttd Edited From Staff login 
    Created on : 27-May-2015, 16:42:38
    Author     : Aravind Tyson Edited By Arun
--%>

<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        
        <form action="UpdatedAttendance.jsp">
        <table class="bordered">
    <thead>

    <tr>
        <th name="cc">Roll No</th>
        <th>Name</th>
        <th>0</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th><th>9</th>
    </tr>
    </thead>
        <%
        
        String hour=request.getParameter("hour");
        String col;
        int vaa=Integer.parseInt(hour);
	String val0="disabled",val1="disabled",val2="disabled",val3="disabled",val4="disabled",val5="disabled",val6="disabled",val7="disabled",val8="disabled",val9="disabled";
        if(vaa==0)
        {
            val0="required";
            col="zero";
        }
        else
            if(vaa==1)
            {
                val1="required";
                col="one";
            }
        else
            if(vaa==2)
            {
                val2="required";
                col="two";
            }else
            if(vaa==3)
            {
                val3="required";
                col="three";
            }else
            if(vaa==4)
            {
                val4="required";
                col="four";
            }else
            if(vaa==5)
            {
                val5="required";
                col="five";
            }else
            if(vaa==6)
            {
                val6="required";
                col="six";
            }else
            if(vaa==7)
            {
                val7="required";
                col="seven";
            }else
            if(vaa==8)
            {
                val8="required";
                col="eight";
            }
            else if(vaa==9)
            {
                val9="required";
                col="nine";
            }    
	
        
        String dept = request.getParameter("dept");
        String sec=request.getParameter("section");
        String batch=request.getParameter("batch");
        String subject=request.getParameter("subject");
        String date=request.getParameter("datepicker");
        String sem = request.getParameter("sem");
        session.setAttribute("hour",hour);
        session.setAttribute("dept", dept);
        session.setAttribute("sec", sec);
        session.setAttribute("batch", batch);
        session.setAttribute("subject",subject);
        session.setAttribute("date",date);
         session.setAttribute("sem",sem);
        
        Connection con = new dbcon().getConnection(dept);
        Statement st=con.createStatement();
        
        int count =0;
        String sql="select * from student_personal where batch='"+batch+"' and dept='"+dept+"' and sec='"+sec+"'";
        ResultSet rs=st.executeQuery(sql);
        //String[] str1=new String[100];
        //String[] str2=new String[100];
        
        while(rs.next())
        {
           
        count++; 
        String rollno=rs.getString("rollno");
        String name=rs.getString("name");
        String str1="str1"+count;
        session.setAttribute(str1,rollno);
        /*str1[count]=rollno;
        str2[count]=name;
        session.setAttribute("rollno",str1[count]);
        session.setAttribute("name",str2[count]);*/
       
        
        %>
        
        <tr>
            <td><%=rollno %></td>
            <td><%=name %></td>
           <td>
                        
                        <select name="<%=count%>0" <%=val0%> >
                            <option value="Present">Present</option>
                            <option value="Absent">Absent</option>
                            
                        </select>
                        </td>
                    <td>
                        
                        <select name="<%=count%>1" <%=val1%>>
                            <option value="Present">Present</option>
                            <option value="Absent">Absent</option>
                            
                        </select>
                        </td>
                    <td>
                        <select name="<%=count%>2" <%=val2%>>
                            <option value="Present">Present</option>
                            <option value="Absent">Absent</option>
                        </select>
                    </td>
                    <td>
                        <select name="<%=count%>3" <%=val3%>>
                            <option value="Present">Present</option>
                            <option value="Absent">Absent</option>
                        </select>
                    </td>
                    <td>
                        <select name="<%=count%>4" <%=val4%>>
                            <option value="Present">Present</option>
                            <option value="Absent">Absent</option>
                        </select>
                    </td>
                    <td>
                        <select name="<%=count%>5" <%=val5%>>
                            <option value="Present">Present</option>
                            <option value="Absent">Absent</option>
                        </select>
                    </td>
                    <td>
                        <select name="<%=count%>6" <%=val6%>>
                            <option value="Present">Present</option>
                            <option value="Absent">Absent</option>
                        </select>
                    </td>
                    <td>
                        <select name="<%=count%>7" <%=val7%>>
                            <option value="Present">Present</option>
                            <option value="Absent">Absent</option>
                        </select>
                    </td>
                    <td>
                        <select name="<%=count%>8" <%=val8%>>
                            <option value="Present">Present</option>
                            <option value="Absent">Absent</option>
                        </select>
                    </td>
                    <td>
                        <select name="<%=count%>9" <%=val9%>>
                            <option value="Present">Present</option>
                            <option value="Absent">Absent</option>
                        </select>
                    </td>
        </tr>      
            
 
        
        <% }
        session.setAttribute("count",count);
        rs.close();

                            if(st!=null)
                            st.close();
                              if(con!=null)
                                ;//con.close();
        %>
   
    
        
</table>
    <input type="submit" value="submit">
        </form>
    </body>
</html>

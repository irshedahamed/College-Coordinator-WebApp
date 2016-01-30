<%-- 
    Document   : reportgenerationpage
    Created on : 27-May-2015, 16:42:38
    Author     : Aravind Tyson
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
        <th name="cc">SUB CODE</th>
        <th>THEORY SUBJECT</th>
        <th>STAFF NAME</th>
        <th>TOTAL PRESENT</th>
        <th>FAIL</th>
        <th>ABSENT</th>
        <th>PASS%</th>
        <th>HIGHEST MARK</th>
        <th>CLASS AVERAGE</th>
    </tr>
    </thead>
        <%
        try{
        String dept = request.getParameter("dept");
        String sec=request.getParameter("section");
        String batch=request.getParameter("batch");
        String sem = request.getParameter("sem");
        String examtype = request.getParameter("examtype");
        String modeltype=request.getParameter("modeltype");
        
        Connection con = new dbcon().getConnection(dept);
        Statement st=con.createStatement();
        Statement st1=con.createStatement();
        
        String sql1="select subject_sem_table.subcode,subject_sem_table.subname,staff_personal_details.name from subject_sem_table,subject_allocation,staff_personal_details where subject_allocation.batch='"+batch+"' "
                + "and subject_allocation.sem='"+sem+"' and subject_allocation.dept='"+dept+"' and subject_allocation.sec='"+sec+"' and subject_sem_table.subtype='theory' "
                + "and subject_sem_table.subcode=subject_allocation.subcode and subject_allocation.staffid=staff_personal_details.rollno;";
        ResultSet rs=st.executeQuery(sql1);
        ResultSet rs1=null;
        //String[] str1=new String[100];
        //String[] str2=new String[100];
        
        while(rs.next())
        {
           
        String sc=rs.getString("subject_sem_table.subcode");  
        String sn=rs.getString("subject_sem_table.subname");
        String staffname=rs.getString("staff_personal_details.name");
        String sql2="select marks_table.* from marks_table where marks_table.subcode='"+sc+"' and marks_table.rollno  in (select rollno from student_personal where model_type='"+modeltype+"')";    
        
        
        rs1=st1.executeQuery(sql2);
        int p=0,f=0,a=0,max=0,et1;
        float pp,total=0,classavg=0;
        while(rs1.next())
        {
            String et=rs1.getString("marks_table."+examtype);
            if(!et.equals("A"))
            {
                p++;
                et1=Integer.parseInt(et);
            total=total+(float)et1;
            if(max<et1)
                max=et1;
            if(et1<45)
                f++;
            }
            else
                a++;
            
            
            
            
        }
        pp=(float)(p+a-f)/(float)(p+a)*100;
        classavg=total/(float)p;
        
        /*str1[count]=rollno;
        str2[count]=name;
        session.setAttribute("rollno",str1[count]);
        session.setAttribute("name",str2[count]);*/
       
        
        %>
        
        <tr>
            <td><%=sc %></td>
            <td><%=sn %></td>
            <td><%=staffname %></td>
            <td><%=p %></td>
            <td><%=f %></td>
            <td><%=a %></td>
            <td><%=pp %></td>
            <td><%=max %></td>
            <td><%=classavg %></td>
        </tr>      
            
 
        
        <% }
        rs1.close();
        rs.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        %>
   
    
        
</table>
    <input type="submit" value="submit">
        </form>
    </body>
</html>

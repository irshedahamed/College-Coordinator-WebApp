<%-- 
    Document   : UpdateAttd
    Created on : 27-May-2015, 16:42:38
    Author     : Aravind Tyson
--%>

<%@page import="Actor.Student"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                        <th>No. of hours Absent</th>
                    </tr>
                </thead>
                <%
            String clg = (String)session.getAttribute("clg");
        String username = (String)session.getAttribute("username");

 String dept = request.getParameter("dept");
        String sec=request.getParameter("section");
        String batch=request.getParameter("batch");
        String subject=request.getParameter("subject");
        String fdate=request.getParameter("datepicker1");
        String tdate=request.getParameter("datepicker2");
        
        session.setAttribute("dept", dept);
        session.setAttribute("sec", sec);
        session.setAttribute("batch", batch);
        session.setAttribute("subject",subject);
        session.setAttribute("fdate",fdate);
        session.setAttribute("tdate",tdate);
        
        Connection con = new dbcon(clg).getConnection(dept);
        Statement st=con.createStatement();
        //Statement st1=con.createStatement();
        
        int count =0;
        List<Student>list=Student.getAll(dept, batch, sec,clg);
        // String sql="select * from student_personal where batch='"+batch+"' and dept='"+dept+"' and sec='"+sec+"' group by rollno";
        //ResultSet rs=st.executeQuery(sql);
        ResultSet rs1;
        String rollno=null,name=null;
        //String[] str1=new String[100];
        //String[] str2=new String[100];
        
        for(Student s:list)
        {
           
        
        
        count=0;
        String rn=new String();
        rn=s.getId();
        
        String DATE_FORMAT = "yyyy-MM-dd";
        SimpleDateFormat simpledataformat = new SimpleDateFormat(DATE_FORMAT);
        
        java.util.Date d1 = null;
	java.util.Date d2 = null;
        long diff,diffDays;
        int d=0;

		try {
			d1 = simpledataformat.parse(fdate);
			d2 = simpledataformat.parse(tdate);

			//in milliseconds
			diff = d2.getTime() - d1.getTime();

			diffDays = diff / (24 * 60 * 60 * 1000);
                        d=(int)diffDays+1;

		} catch (Exception e) {
			e.printStackTrace();
		}
                
                String date[]=fdate.split("-");
                int a=Integer.parseInt(date[0]);
                int b=Integer.parseInt(date[1])-1;
                int c=Integer.parseInt(date[2]);
        
        Calendar c1 = Calendar.getInstance(); 
        c1.set(a, b , c); // 2007 jan 20
       
        for(int i=1;i<=d;i++)
        {
            String dt=simpledataformat.format(c1.getTime());
             
                
            String sql1="select * from hourattendence where rollno=?";
            PreparedStatement st1=con.prepareStatement(sql1);
            st1.setString(1, rn);
            rs1=st1.executeQuery();
        %>
         <!--    <h1><%=dt %></h1> -->
                <% 
                while(rs1.next())
                {
                  
            if(rs1.getString(2).equals(dt))
            {
                 
                for(int j=3;j<=12;j++)
        {
            if(rs1.getString(j)!=null && rs1.getString(j).equals(subject))
            count++; 
        }
               
        
            }  
            
            
                }
                c1.add(Calendar.DATE,1);
                rollno=s.getId();
        name=s.getName();
                }
        
        
        if(rollno!=null && name!=null);
        {
        
        %>
        
        <tr>
            <td><%=rollno %></td>
            <td><%=name %></td>
            <td><%=count %></td>
            
            
        </tr>  
            
 
        
        <% 
        }
        }
        session.setAttribute("count",count);
        //rs.close();

                            if(st!=null)
                            st.close();
          //                  if(st1!=null)
            //                    st1.close();
              //                if(con!=null)
                //                con.close();
        %>
        
         
   
    
        
</table>
        </form>
    </body>
</html>

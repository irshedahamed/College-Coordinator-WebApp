<%-- 
    Document   : UpdateAttd
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
        
             <script type="text/javascript" src="../js/jquery.js"></script>
     
        <script type="text/javascript" lang="javascript">
            $(document).ready(function(){
                
               $("form").submit(function(){
                   
                   var box=$(".box");
                   check=0;
                   $.each(box,function(index,value){
                     //  console.log(value.checked);
                       if(value.checked)
                       {
                       var reason=$("#reason"+value.id.substring(3))[0];
                        if(reason.options[reason.selectedIndex].value==="#")
                        {
                console.log(value.id.substring(3));
                              reason.focus();
                //     console.log("false");
                      check=1;      
                        }
                    }
                   });
                   if(check===1)
                   return false;
                   else
                       return true;
               }); 
                
            });
            
        </script>
      
        
    </head>
    
    <body>
        
        <form action="${pageContext.request.contextPath}/attinchargeupdate" method="post">
       <center> <table class="bordered">
    <thead>
        <%
            String date=request.getParameter("datepicker");
            %>

    <tr>
        <th name="cc">Roll No</th>
        <th>Register Number</th>
        <th>Name</th>
        <th><%=date%>(Tick if Absent)</th>
        <th>Reason</th>
    </tr>
    </thead>
        <%
        
        
	
        
        String dept = request.getParameter("dept");
        String sec=request.getParameter("section");
        String batch=request.getParameter("batch");
       
        
        String sem = request.getParameter("sem");
       
        session.setAttribute("dept", dept);
        session.setAttribute("sec", sec);
        session.setAttribute("batch", batch);
        
        session.setAttribute("date",date);
         session.setAttribute("sem",sem);
        
        Connection con = new dbcon().getConnection(dept);
        Statement st=con.createStatement();
        
        int count =0;
        String sql="select *,CONVERT(regno,UNSIGNED INT) as sno from student_personal where batch='"+batch+"' and sec='"+sec+"' order by sno,name";
        ResultSet rs=st.executeQuery(sql);
        //String[] str1=new String[100];
        //String[] str2=new String[100];
        
        while(rs.next())
        {
           
        count++; 
        String rollno=rs.getString("rollno");
        String name=rs.getString("name");
        String regno=rs.getString("regno");
        String str1="str1"+count;
        session.setAttribute(str1,rollno);
        /*str1[count]=rollno;
        str2[count]=name;
        session.setAttribute("rollno",str1[count]);
        session.setAttribute("name",str2[count]);*/
       
        
        %>
        
        <tr>
            <td><%=rollno %></td>
            <td><%=regno%></td>
            <td><%=name %></td>
           <td>
                        
               <input type="checkbox" id="box<%=count%>" class="box"  name="<%=rollno%>val" value="Absent">
           </td>
           <td>
               <select id="reason<%=count%>" name="<%=rollno%>reason" >
                   <option value="#">Select</option>
                   <option value="AB">Absent</option>
                   <option value="Previous Permission">Previous Permission</option>
                   <option value="Mediacal Leave">Medical Leave</option>
                   <option value="Suspension">Suspended</option>
                   <option value="OD">On Duty</option>
               </select>            
                        
                        </td>
                    
        </tr>      
            
 
        
        <% }
        session.setAttribute("count",count);
        rs.close();

                            if(st!=null)
                            st.close();
                              if(con!=null)
                                con.close();
        %>
   
    
        
</table>
        <input type="submit" value="submit"></center>
        </form>
    </body>
</html>

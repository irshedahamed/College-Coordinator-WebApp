<%-- 
    Document   : getmarks
    Created on : 26 May, 2015, 2:39:34 PM
    Author     : aravind
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <% 
   try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type ="";
    ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        while(rsss.next())
        {
            type = rsss.getString("type");
        }
        if(type.equals("exam"))
        {
    
    
    %>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <script type = "text/javascript"  src = "${pageContext.request.contextPath}/js/jquery.js"></script>
	
        <script type="text/javascript">
            $(document).ready(function(){
                $("#marks").submit(function(){
                    flag=0;
                    $(".marks").each(function(index){
                      
                        var patt = /^[0-9]+$/;
                        var result = patt.test($(this).val());
   
                        var result1=$(this).val()==='A';
                        if($(this).val()=== ''||(result===false && result1===false))
                        {
                            $(this).focus();
                            $(this).css({"border-color": "#9ecaed",
    "box-shadow":" 0 0 10px #9ecaed"});
                            flag=1;
                        }else{
                             $(this).css({"border-color": "",
    "box-shadow":""});
                        }
                            
                      //  console.log(index + ": " + $( this ).val());
                    });
                    if(flag===1)
                    return false;
                });
                
            });
            
    </script>
    </head>
    <%
        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        Connection con = new dbcon().getConnection("sjitportal");
   
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
        String ayear=request.getParameter("ayear");
       
       
        
        String regulation=null;
        String subcode,rollno,name;
        
        Statement st= con.createStatement();
        String sql="select * from regulations where batch='"+batch+"'";
        ResultSet rs= st.executeQuery(sql);
        while(rs.next())
        {
            regulation=rs.getString("regulation");
        }
        session.setAttribute("regulation",regulation);
        session.setAttribute("sem",sem);
        session.setAttribute("batch",batch);
        session.setAttribute("sec", sec);
        session.setAttribute("dept",dept);
        session.setAttribute("exam", exam);
        rs.close();
        st.close();
        con.close();
        int count=0;
        %>
        <body>
        <center><h1>Mark Update for <%=dept.toUpperCase()%> Department <%=batch%> batch  <%=sem%>th semester <%=sec%> section</h1></center>
        <form action="${pageContext.request.contextPath}/markupdate" id="marks" method="post">
            <center>
        <table class="bordered">
    <thead>

    <tr>
        <th name="cc">Roll No</th>
         <th>Register No</th>
        <th>Name</th>
        <%
       con = new dbcon().getConnection(dept);
    st=con.createStatement();
        
   
       String sql1 = "select * from subject_sem_table where regulation='"+regulation+"' and sem='"+sem+"' and (ayear like '%elective%"+ayear+"%' or ayear like 'all')  and subtype='theory' order by subcode" ;
     rs=st.executeQuery(sql1);
        String[] subcodes=new String[8];
        while(rs.next())
        {
        subcode = rs.getString("subcode");
       
           subcodes[count]=subcode;
        
        count++;
        
        
        
        %>
        
        
            
        <th><%=subcode%></th>
        
        <% }
        rs.close();
        %>
    </tr>
    </thead>
    
    <%
  //     String sql2= "select * from student_personal where batch='"+batch+"' and sec='"+sec+"' order by rollno";
            String sql2= "select *,CONVERT(regno,UNSIGNED INT) as sno from student_personal where batch='"+batch+"' and sec='"+sec+"' order by sno,name";
  
        
     rs=st.executeQuery(sql2);
     while(rs.next())
     {
         rollno=rs.getString("rollno");
         name = rs.getString("name");
         String regno=rs.getString("regno");
         String sql3 ="select * from marks_table where rollno='"+rollno+"' and sem='"+sem+"' order by subcode";
         Statement st1 = con.createStatement();
         ResultSet rs1 = st1.executeQuery(sql3);
         
       
        %>
      
    <tr>
        <td><%=rollno%></td> 
        <td><%=regno%></td>
        <td><%=name%></td>
        <%
        for(int i=0;i<count&&rs1.next();i++)
        {
            String a1=rollno+"_"+i;
            String value = rs1.getString(exam);
             subcode=rs1.getString("subcode");
        if(subcodes[i].equals(subcode))
{
%>
        
        <td><input type="text" size="3" class="marks" maxlength="3" name="<%=a1%>" id="<%=a1%>" value="<%=value%>"></td>

       <%
           }
else
{
rs1.previous();
       %>
<td><input type="text" size="3"  disabled="disabled"></td>

        
        <%
            }
       }
     }
     rs.close();
     
                            if(st!=null)
                            st.close();
                              if(con!=null)
                                con.close();
     %>
    </tr>        
    
        
</table>
            </center>
    <input type="submit" value="submit">
        </form>
    </body>
   <%
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

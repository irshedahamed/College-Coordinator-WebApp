<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.action.Find"%>
<%@page import="General.AcademicYear"%>
<%@page import="Actor.Student"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
       <style rel="stylesheet">
        


table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
      
    overflow-x : auto; 
}


.bordered {
    border: solid #ccc 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 1px #ccc; 
    -moz-box-shadow: 0 1px 1px #ccc; 
    box-shadow: 0 1px 1px #ccc;         
}

.bordered tr:hover {
    background: #fbf8e9;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;     
}    
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 4px;
    text-align: left;    
}

.bordered th {
    background-color: #dce9f9;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
}

.bordered td:first-child, .bordered th:first-child {
    border-left: none;
}

.bordered th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;
}

.bordered th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.bordered th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}

h2{
    font-size: 18px;
    margin: 0px;
    padding: 0px;
}
            thead {display: table-header-group;}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MarksUploadCheck</title>
    </head>
    <%
        String dept = request.getParameter("dept");
        if(dept==null)
        {
            dept= session.getAttribute("dept").toString();
        }
        String batch = request.getParameter("batch");
        
        Connection con = new dbcon().getConnection("sjitportal");
   
        String sem = request.getParameter("sem");
        String exam1 = request.getParameter("exam");
        
       String[] exams=new String[3];
        if(exam1.equals("m1")){
            exams[0] = new String("model1");
            exams[1]= new String("cycle1");
            exams[2]= new String("unit1");
            
        }
        if(exam1.equals("m2")){
            exams[0] = new String("model2");
            exams[1]= new String("cycle2");
            exams[2]= new String("unit2");
            
        }
        if(exam1.equals("m3")){
            exams[0] = new String("model3");
            exams[1]= new String("cycle3");
            exams[2]= new String("unit3");
            
        }
        String secs[] ={"A","B","C","D"};
        
        String regulation=null;
        String subcode ,rollno;
        
       // Statement st= con.createStatement();
        String sql="select * from regulations where batch=?";
        PreparedStatement st=con.prepareStatement(sql);
        st.setString(1, batch);
        ResultSet rs= st.executeQuery();
        while(rs.next())
        {
            regulation=rs.getString("regulation");
        }
        session.setAttribute("regulation",regulation);
        session.setAttribute("sem",sem);
        session.setAttribute("batch",batch);
       
        session.setAttribute("dept",dept);
        session.setAttribute("exam", exam1);
        rs.close();
        st.close();
        ;//con.close();
        int count=0;
        %>
        <body>
        
    <center> <img src="../images/logo2.png" height="165px" width="700px" /></center>

            <div id="yourTableIdName1">
        <center><h1 style="top:300px;">DEPARTMENT: <%=dept.toUpperCase()%> </h1></center>
        <center><h2><a style="margin-right:1000px;">BATCH: <%=batch%>   </a><p style="margin-left:750px;margin-top:-25px;">  SEM: <%=sem%></p></h2></center>
            </div>
        <center>
        <form action="${pageContext.request.contextPath}/markupdate" method="post">
<%             for(String sec:secs){
%>
            <table class="bordered">
    <thead>
    <center><h3>SECTION :<%=sec%></h3></center>
  
    <tr>
        <th>Exam Type</th>
        <%
            con = new dbcon().getConnection(dept);
   // st=con.createStatement();
               String sql1 ="select * from subject_sem_table where regulation=? and sem=? and (ayear like '%elective%"+"17"+"%' or ayear like 'all')  and subtype='theory' order by subcode" ;
               PreparedStatement stt=con.prepareStatement(sql1);
               stt.setString(1, regulation);
               stt.setString(2, sem);
               
               rs=stt.executeQuery();
        
        while(rs.next())
        {
           
        subcode = rs.getString("subcode");
        count++;
        
        
        
        
        %>
       <%               
                     //       Statement s4=con.createStatement(); 
                     PreparedStatement s4=con.prepareStatement("select * from subject_sem_table where subcode=?" );
                     s4.setString(1, subcode);
                     ResultSet rssub=s4.executeQuery();
                
                String subjname="";
                    while(rssub.next())
                    {
                        
                        subjname=rssub.getString("subname");
    %>      
    <%               
        //  Statement s5=con.createStatement();
        PreparedStatement s5=con.prepareStatement("select * from subject_allocation where batch=? and sem=? and subcode=? and sec=?");
        s5.setString(1, batch);
        s5.setString(2, sem);
        s5.setString(3, subcode);
        s5.setString(4, sec);
        ResultSet rsss= s5.executeQuery();
                   
              String staffname = new String();
                    
                    
              if(rsss.next())
              {
                  staffname=rsss.getString("staffname");
                  if(staffname==null||staffname.equals("null"))
                  staffname="nil";
              }
   
        %>
            
        <th><%=subjname%>(<%=subcode%>)<br<%=staffname%></th>
       
        <% 
rsss.close();        
}
rssub.close();

}
rs.close();

        %>

    <%
        
       
    %>
    </tr>
    </thead>
    
        <% for(String exam:exams){
        
        %>
        <tr>
    <td><%=exam.toUpperCase()%></td>
    
    <%
         
       String sql5 ="select * from subject_sem_table where regulation=? and sem=? and (ayear like '%elective%"+"17"+"%' or ayear like 'all')  and subtype='theory' order by subcode" ;
      // Statement st1 = con.createStatement();
     PreparedStatement st1=con.prepareStatement(sql5);
     st1.setString(1, regulation);
     st1.setString(2, sem);
     
      ResultSet rs1=st1.executeQuery();
  String pk=new String();
                
        while(rs1.next())
        {
        subcode = rs1.getString("subcode");
        String sql6 = "select * from marks_table where  subcode=? " ;
   
     //   Statement st2 = con.createStatement();
     PreparedStatement  st2=con.prepareStatement(sql6);
     st2.setString(1, subcode);
     ResultSet rs2 = st2.executeQuery();
       int counta1=0,counta2=0;
        while(rs2.next())
        {                  
         rollno=rs2.getString("rollno");
         String sqlm="select ? from student_personal where rollno=? and sec=?";
         //Statement s3=con.createStatement();
         PreparedStatement s3=con.prepareStatement(sqlm);
         s3.setString(1, exam);
         s3.setString(2, rollno);
         s3.setString(3, sec);
         ResultSet rss=s3.executeQuery();
         String section=new String();
             
         String marks= rs2.getString(exam);
                                                 
               
         while(rss.next()){
             
       if(marks!=null )
           if(!(marks.equals("null"))&&!(marks.equals("")))
       counta1++;
       counta2++;                 
             
        
         }

         
        
                             
        }
        rs2.close();
        String a=new String();
        a="Updated";
        if(counta1==counta2&&counta1!=0)
        a="Fully Updated";
 
        else if((counta2>counta1)&&counta1!=0)
        a="Partially Updated";
        
        else
            a="Not Updated";
        
    %>
   
<td><%=a%></td>

<%
       
}



        rs1.close();
}
}%>
    </tr>        
    
        
</table>
<br><br><br>
<%    
                            if(st!=null)
                            st.close();
                              if(con!=null)
                                ;//con.close();

     %>
        </form>
        </center>
    </body>
</html>

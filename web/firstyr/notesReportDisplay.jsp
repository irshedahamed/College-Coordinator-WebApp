
<%@page import="General.AcademicYear"%>
<%-- 
    Document   : PasswordReport
    Created on : Aug 10, 2016, 9:38:34 AM
    Author     : Lenovo
--%>
<%@page import="General.Batch"%>
<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
<%-- 
    Document   : studentpassword
    Created on : 14 May, 2016, 6:56:07 PM
    Author     : Arun
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <style rel="stylesheet">
            /*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
*/
/* 
    Created on : 26 May, 2015, 3:36:50 PM
    Author     : aravind
*/



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
        <title></title>
    </head>
    <body>
    
    <center> <img src="../images/logo2.png" height="165px" width="700px" /></center>
        
       <center>
           <center><h1>Notes Upload Report</h1></center>
           <h2>Batch : <%=request.getParameter("batch")%>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
               Dept : <%=request.getParameter("dept").toUpperCase() %></h2>  
           <table class="bordered">
            
            <th>Subcode</th>
            
                
                <%
           String semester = request.getParameter("sem");
                    String ayear=request.getParameter("ayear");
                    String batch=request.getParameter("batch");
                    String dept = request.getParameter("dept");
                    //batch.substring(, endIndex)
                    Connection con = new dbcon().getConnection("sjitportal");
                    
                   
                    ResultSet rs;
                    ResultSet rs1;
                    ResultSet rs2;
                    ResultSet rs3;
                    ResultSet rs4;
                    List<String> list = new ArrayList<String>();
                     Statement st2 = con.createStatement();
                    rs2=st2.executeQuery("select regulation from regulations where batch='"+batch+"'");
                        String regulation=new String();
                        if(rs2.next())
                        {
                          regulation=rs2.getString("regulation");  
                        }
                        
                        
                        con = new dbcon().getConnection(dept);
                       Statement st = con.createStatement();
                    Statement st1 = con.createStatement();
                     Statement st3 = con.createStatement();
                     Statement st4 = con.createStatement();   
                        
                    rs=st.executeQuery("select * from subject_sem_table where sem='"+semester+"' and (ayear like '%elective%"+ayear+"%'or ayear like 'all') and regulation='"+regulation+"' and subtype='theory'");    
                        while(rs.next())
                        {
                            String subc=rs.getString("subcode");
                            list.add(subc);
                        }
                        List<String> list1 = new ArrayList<String>();
                            
                        {
            
            list1.add("question_bank");
            list1.add("prev_univ_quest");
            list1.add("prev_univ_ans");
            
            
                        }
                        
                        %>
            <th>Class Notes 1</td>
            <th>Class Notes 2</td>
            <th>Class Notes 3</td>
            <th>Class Notes 4</td>
            <th>Class Notes 5</td>
            <th>Cycle Test 1</th>
            <th>Cycle Test 2</th>
            <th>Cycle Test 3</th>
            <th>Question bank</th>
            <th>Previous year Questions</th>
            <th>Previous year Answers</th>
            
            <%
                int i,j,k,l;
                for(i=0;i!=list.size();i++)
                {
                    String subc=list.get(i);
                    %>
                    <tr>
                        <td><%=subc%></td>
                    <%
                        
                        String classnotes = new String();
                        classnotes="class_notes";
                        for(j=0;j<5;j++){
                            
                            rs1=st1.executeQuery("select * from notes where subcode='"+subc+"' and sem='"+semester+"' and acadamic_yr='"+ayear+"' and notes_type='"+classnotes+"' and subCategory='"+(j+1)+"'");
                        
                            if(rs1.next()){
                            String t= rs1.getString("time");
                        %>
                        
                        <td><%=rs1.getString("by") %><br><%=t%></td>
                        
                        
                        
                        
                        
                                <%
                        }else{
                        %>
                        <td></td>
                        <%
}
                        
                        }
                        String cycleques = new String();
                        cycleques="cycle_test_que";
                        for(k=0;k<3;k++){
                        
                            rs3=st3.executeQuery("select * from notes where subcode='"+subc+"' and sem='"+semester+"' and acadamic_yr='"+ayear+"' and notes_type='"+cycleques+"' and subCategory='"+(k+1)+"'");
                            if(rs3.next()){
                            String t1=rs3.getString("time");
                            %>
                            <td><%=rs3.getString("by") %><br><%=t1%></td>
                            <%
                            }else{
                            %>
                            <td></td>
                            <%
                            }
                            }
                    for(l=0;l<list1.size();l++)
                    {
                        String s[]=new String[15];
                        s[l]=list1.get(l);
                        
                        rs4=st4.executeQuery("select * from notes where subcode='"+subc+"' and sem='"+semester+"' and acadamic_yr='"+ayear+"' and notes_type='"+s[l]+"'");
                        if(rs4.next())
                        {
                           
                            String time=rs4.getString("time");
                            
                           
                                  
                                                             %>
                           <td><%=rs4.getString("by") %><br><%=time%></td>
                    
                            <%
                                 
                                           }else{
                                           %>
                                           <td></td>
                                           <%
                            }}
                    %>                       
                    </tr>
                         
                        
                        <%
                    
}
con.close();
                    %>
              
    
       </center>
            </body>
</html>

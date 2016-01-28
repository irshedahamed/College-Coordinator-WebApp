<%-- 
    Document   : showallocatedsubjects
    Created on : 29 May, 2015, 12:18:33 AM
    Author     : aravind
--%>

<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    
    <head>
        <style>
        .omega
        {
        mso-page-orientation:landscape;
        }
    </style>
    <style>
        table.bordered {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width:70%;
    overflow-x : auto; 
    background: #ffffff
}
table.bordered1 {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 100%; 
    height: 170px;
    overflow-x : auto; 
    background: #ffffff
}
.bordered1 td, .bordered1 th {
   
    
    text-align: left;    
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
   
    padding: 10px;
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
</style>
<div class='omega'>
    <center> <h1>St.Joseph's Institute of Technology</h1></center>
    </head>
    <body><center>
        <%
            String a = request.getParameter("word");
            if(a!=null)
            {
            if(a.equals("yes"))
            {
                String formName = "";
                        formName = "test.doc";
                        File filepath = new File(formName);
                        response.setContentType("application/vnd.ms-word");
                        response.setHeader("Content-Disposition", "inline; filename=" + filepath);
            }
            }
            int totalhrs=0 ;
            String id=request.getParameter("staff");
            String acyear = request.getParameter("acyear");
            if(id!=null)
            {
            if(id.equals("all"))
            {
                
                
                %>
                <center><h1>Department of CSE</h1></center>
                <br>
                
                <center><b>Subject Allotment <%=acyear%></b></center>
                <br>
                <table class="bordered" name='suballoc'>
                    <tr>
                        <th>NAME OF THE STAFF</th>
                        <th> THEORY </th>
                        
                        
                        <th>THEORY HRS</th>
                        <th>LAB </th>
                        
                        <th>LAB HRS</th>
                  
                    </tr>
                    
                
                
                <%
                Connection con=new dbcon().getConnection("cse"); 
                 Statement st = con.createStatement();
                 ResultSet rs1 = st.executeQuery("select * from staff_table");
                 Statement st1 = con.createStatement();
                 Statement st2 = con.createStatement();
                
                 while(rs1.next())
                 {
                     int count1=0,count2=0,sp=0;
                     String staffid = rs1.getString("staffid").toString();
                     String staffname = rs1.getString("staffname").toString();
                      ResultSet rs2 = st1.executeQuery("select * from subject_allocation where staffid='"+staffid+"' and subtype='theory' and acyear='"+acyear+"'");
                     while(rs2.next())
                     {
                        count1++; 
                     }
                      ResultSet rs3=st2.executeQuery("select * from subject_allocation where staffid='"+staffid+"' and subtype='lab' and acyear='"+acyear+"'");
                      while(rs3.next())
                      {
                          count2++;
                      }
                      if(count1>=count2)
                      {
                          sp=count1;
                      }
                      else
                      {
                          sp=count2;
                      }
                      rs2.beforeFirst();
                      rs3.beforeFirst();
                     totalhrs=0;
                     %>
                     <tr>
                         <td rowspan="<%=sp%>">
                         <%=staffname%>
                     </td>
                     
                         
                             
                        
                     
                     <%
                     int i=0;
                  String subcode,dept,sec,sem,hrs="",subcode1="",dept1="",sec1="",sem1="",hrs1="";
                     while(i<sp)
                     {
                         if(rs2.next())
                         {
                            
                          subcode=rs2.getString("subcode");
                          dept = rs2.getString("dept");
                          sec = rs2.getString("sec");
                          sem = rs2.getString("sem");
                         hrs= rs2.getString("no_of_hours");
                          if(hrs==null)
                             hrs="0";
                         totalhrs = totalhrs+Integer.parseInt(hrs);
                         }
                         else
                         {
                             subcode=" ";
                             dept= " ";
                             sec= " ";
                             sem= " ";
                             hrs= " ";
                                    
                         }
                        
                         if(rs3.next())
                         {
                             
                          subcode1=rs3.getString("subcode");
                         dept1 = rs3.getString("dept");
                         sec1 = rs3.getString("sec");
                         sem1 = rs3.getString("sem");
                         hrs1= rs3.getString("no_of_hours");
                         if(hrs1==null)
                             hrs1="0";
                         totalhrs = totalhrs+Integer.parseInt(hrs1);
                         }
                         else
                         {
                             subcode1=" ";
                             dept1= " ";
                             sec1= " ";
                             sem1= " ";
                             hrs1= " ";
                         }
                         
                         %>
                         
                         <%
                        
                        
                         %>
                         <% if(!subcode.equals(" "))
                         {
                             
                         %>
                         <td><%=subcode%> (<%=sem%> SEM) (<%=dept%>-<%=sec%>)</td>
                         <td><%=hrs%></td>
                        <% }else{%>
                        <td>----</td><td>----</td> <%}%>
                         <% if(!subcode1.equals(" "))
                         {
                             
                         %>
                         <td><%=subcode1%> (<%=sem1%> SEM) (<%=dept1%>-<%=sec1%>)</td>
                         <td><%=hrs1%></td>
                         <% }else{%>
                       <td>----</td><td>----</td> <%}%>
                      
                         </tr>
                         <%
                     i++;
                     }
                     
                     %>
                    
                     
                     
                    
                         
                     <%
                
                 
                     
                     %>
                             
                       
                     
                     
                  
                        
                         
                 <%
                 
                 }
                 
                %>
                </table>
                <%
            }
            
            else
            {
            
            
            
            
            %>
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
            ResultSet rs1 = st.executeQuery("select * from subject_allocation where staffid='"+id+"' and acyear='"+acyear+"'");
            ResultSet rs2;
            String batch,subcode,subname=null,dept,sec,sem;
            while(rs1.next())
            {
                batch=rs1.getString("batch");
                sem=rs1.getString("sem");
                dept=rs1.getString("dept");
                subcode=rs1.getString("subcode");
                sec =rs1.getString("sec");
                rs2=st1.executeQuery("select subname from subject_table where subcode='"+subcode+"'" );
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
            <% }
            }%>
            <a href ="showallocatedsubjects.jsp?word=yes&staff=<%=id%>&acyear=<%=acyear%>" >Export to word</a>
    </body>
</div>
</html>

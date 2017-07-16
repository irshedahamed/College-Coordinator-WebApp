
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

    <center><h2>Department of <%=request.getParameter("dept").toUpperCase() %></h2></center>


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

              
               
               Sem:<%=request.getParameter("sem")%><br>
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
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               Acadamic Year:<%=request.getParameter("ayear")%></h2>
               
           <table class="bordered">
               
         

               
             
            <th>Subcode</th>

            
                
                <%
           String semester = request.getParameter("sem");
                    String ayear=request.getParameter("ayear");
                    String batch=request.getParameter("batch");
                    String dept = request.getParameter("dept");;
                    //batch.substring(, endIndex)
                    Connection con = new dbcon().getConnection("sjitportal");
                    
                   
                    ResultSet rs;
                    ResultSet rs1;
                    ResultSet rs2;
                    ResultSet rs3;
                    ResultSet rs4;
                    ResultSet rs5;
                    ResultSet rs6;
                    ResultSet rs7;

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
                     Statement st5 = con.createStatement();
                     Statement st6 = con.createStatement();
                     Statement st7 = con.createStatement();

                        
                    rs=st.executeQuery("select * from subject_sem_table where sem='"+semester+"' and (ayear like '%elective%"+ayear+"%'or ayear like 'all') and regulation='"+regulation+"' and subtype='theory'");    
                        while(rs.next())
                        {

                            String subc=new String();
                            subc=rs.getString("subcode");
                        %>
                        <td><%=subc%></td></th>
                            
                            <%
                                }
                                
                        
                        List<String> list1 = new ArrayList<String>();
                        List<String> list2 = new ArrayList<String>();
                        List<String> list3 = new ArrayList<String>();
                        List<String> list4 = new ArrayList<String>();
                        List<String> list5 = new ArrayList<String>();
                        List<String> list6 = new ArrayList<String>();
                        List<String> list7 = new ArrayList<String>();
                        List<String> list8 = new ArrayList<String>();
                        List<String> list9 = new ArrayList<String>();
                        
                            
                        {
            
            list1.add("class_notes");
            list1.add("class_notes");
            list1.add("class_notes");
            list1.add("class_notes");
            list1.add("class_notes");
            list2.add("cycle_test");
            list2.add("cycle_test");
            list2.add("cycle_test");
            list3.add("unit_keys");
            list3.add("unit_keys");
            list3.add("unit_keys");
            list3.add("unit_keys");
            list3.add("unit_keys");
            list4.add("syallabus");
            list4.add("prev_univ_quest");
            list4.add("prev_univ_ans");
            list5.add("Class notes");
            list5.add("Class notes");
            list5.add("Class notes");
            list5.add("Class notes");
            list5.add("Class notes");
            list6.add("Cycle test");
            list6.add("Cycle test");
            list6.add("Cycle test");
            list7.add("Unit test");
            list7.add("Unit test");
            list7.add("Unit test");
            list7.add("Unit test");
            list7.add("Unit test");
            list8.add("Syallabus");
            list8.add("Prev univ question");
            list8.add("Prev univ answers");
                        }
                    int i,j,k,l,m,n,o,p;
                        
                            rs1=st1.executeQuery("select * from subject_sem_table where sem='"+semester+"' and (ayear like '%elective%"+ayear+"%'or ayear like 'all') and regulation='"+regulation+"' and subtype='theory'");    
                        while(rs1.next())
                        {
                        String subc1=rs1.getString("subcode");
                            list9.add(subc1);
                            }
                            for(i=0;i<list1.size();i++){
                            String a[]=new String[20];
                            a[i]=list1.get(i);
                            %>
                            <tr>
                                <td><%=list5.get(i)%></td>
                            <%
                            for(j=0;j<list9.size();j++){
                            String b[]=new String[35];
                            b[j]=list9.get(j);
                            rs3=st3.executeQuery("select * from notes where subcode='"+b[j]+"' and sem='"+semester+"' and acadamic_yr='"+ayear+"' and notes_type='"+a[i]+"' and subCategory='"+(i+1)+"'");
                            if(rs3.next()){
                            %>
                                                            
                            <td><%=rs3.getString("by") %><br><%=rs3.getString("time")%></td>    
                            <%
                            }else{
                            %>
                            
                            <td></td>
                            <%
                            }
                            }
                                }                  
                        
                        for(k=0;k<list2.size();k++){
                            String c[]=new String[20];
                            c[k]=list2.get(k);
                            %>
                            <tr>
                                <td><%=list6.get(k)%></td>
                            <%
                            for(l=0;l<list9.size();l++){
                            String d[]=new String[35];
                            d[l]=list9.get(l);
                            rs4=st4.executeQuery("select * from notes where subcode='"+d[l]+"' and sem='"+semester+"' and acadamic_yr='"+ayear+"' and notes_type='"+c[k]+"' and subCategory='"+(k+1)+"'");
                            if(rs4.next()){
                            %>
                                                            
                            <td><%=rs4.getString("by") %><br><%=rs4.getString("time")%></td>    
                            <%
                            }else{
                            %>
                            
                            <td></td>
                            <%
                            }
                            }
                                }                  
                        for(m=0;m<list3.size();m++){
                            String e[]=new String[20];
                            e[m]=list3.get(m);
                            %>
                            <tr>
                                <td><%=list7.get(m)%></td>
                            <%
                            for(n=0;n<list9.size();n++){
                            String f[]=new String[35];
                            f[n]=list9.get(n);
                            rs5=st5.executeQuery("select * from notes where subcode='"+f[n]+"' and sem='"+semester+"' and acadamic_yr='"+ayear+"' and notes_type='"+e[m]+"' and subCategory='"+(m+1)+"'");
                            if(rs5.next()){
                            %>
                                                            
                            <td><%=rs5.getString("by") %><br><%=rs5.getString("time")%></td>    
                            <%
                            }else{
                            %>
                            


                            <td></td>
                            <%
                            }
                            }

                                }                  
                        for(o=0;o<list4.size();o++){
                            String g[]=new String[20];
                            g[o]=list4.get(o);
                            %>
                            <tr>
                                <td><%=list8.get(o)%></td>
                            <%
                            for(p=0;p<list9.size();p++){
                            String h[]=new String[35];
                            h[p]=list9.get(p);
                            rs6=st6.executeQuery("select * from notes where subcode='"+h[p]+"' and sem='"+semester+"' and acadamic_yr='"+ayear+"' and notes_type='"+g[o]+"' and subCategory='"+(o+1)+"'");
                            if(rs6.next()){
                            %>
                                                            
                            <td><%=rs6.getString("by") %><br><%=rs6.getString("time")%></td>    
                            <%
                            }else{
                            %>
                            
                            <td></td>
                            <%
                            }
                            }
                                }                  
                        
           


con.close();
                    %>
              
    
       </center>
            </body>
</html>

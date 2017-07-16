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
    
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type = "text/javascript"  src = "${pageContext.request.contextPath}/js/jquery.js"></script>
       
        <link rel="stylesheett" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> 
        
        <script type = "text/javascript"  src = "${pageContext.request.contextPath}/js/NumberToWords.js"></script>

            <%
        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
      
   
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
        String subcode = request.getParameter("subject");
       
       %>
       
        <script type="text/javascript">
            $(document).ready(function(){
       
        var maxmark=$("#max").val();
         $(".outof").html("/"+$("#max").val());
         $("#max").on('change',function(){
             maxmark=$(this).val();
       $(".outof").html("/"+$(this).val());      
        
        
         });
        
                $(".marks").on("change",function(e){
                    
           //         console.log($(this)[0].id);
                    var id=$(this)[0].id;
                    var words=inWords(parseInt($(this).val()));
                    if($(this).val()==='N')
                    $("#words"+id).html("No Exam");    
                    else if($(this).val()==='A')
                    $("#words"+id).html("Absent");    
                    else
                    $("#words"+id).html(words);
                    
                });
                
                $("#marks").submit(function(){
                    flag=0;
                    $(".marks").each(function(index,value){
                        
                       
                        
        
        var patt = /^[0-9]+$/;
                        var result = patt.test($(this).val());
   
                        var result1=($(this).val()==='A'||$(this).val()==='N');
                        if($(this).val()=== ''||(result===false && result1===false))
                        {
                            $(this).focus();
                            $(this).css({"border-color": "rgb(193, 82, 82)",
    "box-shadow":" 0 0 10px #f00"});
                            flag=1;
                        }else{
                                                $(this).css({"border-color": "","box-shadow":""});
                          
            if(parseInt($(this).val())>maxmark)
                            {
                                
                            $(this).focus();
                            $(this).css({"border-color": "rgb(193, 82, 82)",
    "box-shadow":" 0 0 10px #f00"});
                            flag=1;
                            }
                                
         
// console.log(inWords(parseInt($(this).val())));
                        }
                            
                      //  console.log(index + ": " + $( this ).val());
                    });
                    if(flag===1)
                    return false;
                else
                {
                    if(parseInt(maxmark)===60)
                    {
                        console.log(60);
                        $(".marks").each(function(index,value){
                            
                            if($(this).val()!=='A'){
                                $(this).val( Math.round((parseInt($(this).val())/2)) );
                            }
                        });
                    }
                }
                });
                
            });
            
    </script>
    </head>
<%
        
        String regulation=null;
        String rollno=null,name=null,regno=null;
        
        session.setAttribute("subject",subcode);
        session.setAttribute("sem",sem);
        session.setAttribute("batch",batch);
        session.setAttribute("sec", sec);
        session.setAttribute("dept",dept);
        session.setAttribute("exam", exam);
        String permit = "true";
       
      
        
        int count=0;
            Connection con = new dbcon().getConnection(dept);
    Statement st=con.createStatement();
    
        
   
   if(permit.equals("true"))
   {
        %>
        <body>
            <center><h1>Mark Update for <%=dept.toUpperCase()%> Department <%=batch%> batch  <%=sem%>th semester <%=sec%> section</h1></center>
        
            <center><h3 style="color: red;">Note- use "A" for Absentees</h3></center>
            <form action="${pageContext.request.contextPath}/staffmarkupdate"  id="marks" method="post">
                <div align="right" style="margin-right: 150px;">
                    <br>
                  Max Marks:
                  <select style=" background: transparent;font-size: 14px;height: 29px;padding: 5px;width:150px;" id="max" >
                        <%if(exam.contains("model")){%>
                        <option selected>100</option>
                        <%}else if(exam.contains("unit")){%>
                        <option selected>48</option>
                        <%}else{%>
                        <option selected>30</option>
                        <option >60</option>
                        
                        <%}%>
                       <br> 
                       </select>
                    </div>
                       <br>
            <center>
        <table class="bordered">
    <thead>

    <tr>
        <th>Sno</th>
        <th name="cc">Roll No</th>
        <th>Name</th>
        <th>Register No</th>

        
        
            
        <th><%=subcode%></th>
        <th>In Words</th>
        
       
       
    </tr>
    </thead>
    
    <%
       String sql2= "select *,CONVERT(regno,UNSIGNED INT) as sno from student_personal where batch='"+batch+"' and sec='"+sec+"' order by sno,name";
    ResultSet rs=st.executeQuery(sql2);
     int i=0;
     while(rs.next())
     {
         rollno=rs.getString("rollno");
         name = rs.getString("name");
         regno=rs.getString("regno");
         
       
        %>
      
    <tr>
        <td><%=i+1%></td>
        <td><%=rollno%></td>        
        <td><%=name.toUpperCase()%></td>
        <td><%=regno%></td>
        <%
      
            String a1=rollno+"_"+i;
            i++;
        
        %>
        
        <td width="150px"><input type="text" class="marks" size="3" maxlength="3" name="<%=a1%>" id="<%=a1%>"><span class="outof"></span></td>
        <td id="words<%=a1%>"></td>
    </tr>

       <%
       
     }
     
     rs.close();
                        if(st!=null)
                            st.close();
                              if(con!=null)
                                con.close();
   }
     %>
    </tr>        
    
        
</table>
    </center>
    <br>
    <center>
        <input type="submit" value="submit" ></center>
        </form>
    </body>
</html>

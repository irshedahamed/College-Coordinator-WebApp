<%-- 
    Document   : Display
    Created on : 16 Mar, 2017, 5:39:38 PM
    Author     : Home
--%>
<%@page import="Actor.Parent"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.action.Find"%>
<%@page import="Actor.Student"%>
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
        if(type.equals("placement"))
        {
    
    
    %>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String batch=request.getParameter("batch");
       
        %>
        
         <center>
    <img src="../images/logo2.png" height="165px" width="700px" />	</center>	
        <body>
      
        <table class="bordered">
    <thead>

    <tr>
       <th>S.No</th>
<th> REG NO</th>
<th>ROLL NO</th>
<th>TITLE(Mr/ Ms)</th>
<th>NAME </th>
<th>GENDER</th>
<th>DATE OF BIRTH (DD/MM/YY)</th>
<th>DATE OF BIRTH (MM/DD/YY)</th>
<th>DATE OF BIRTH (YYYY-MM-DD)</th>
<th>COLLEGE</th>
<th>DEGREE</th>
<th>BRANCH</th>
<th>SECTION</th>
<th>DATE OF ADMISSION</th>
<th>10TH PERCENTAGE</th>
<th>10 TH BOARD OF STUDY</th>
<th>10 TH MEDIUM OF STUDY</th>
<th>10 TH YEAR OF PASSING</th>
<th>NAME OF SCHOOL</th>

<th>12 TH PERCENTAGE</th>
<th>12 TH BOARD OF STUDY</th>
<th>12 TH MEDIUM OF STUDY</th>
<th>12 TH YEAR OF PASSING</th>
<th>NAME OF SCHOOL</th>

<th>DIPLOMA - SPECILIZATION/BRANCH</th>
<th>DIPLOMA PERCENTAGE</th>
<th>DIPLOMA YEAR OF PASSING</th>
<th>NAME OF THE INSTITUTE</th>

<th>LAND LINE NUMBER</th>
<th>PRIMARY MOBILE NO</th>
<th>EMERGENCY CONTACT NO</th>
<th>PRIMARY EMAIL ID</th>

<th>SPORTS QUOTA</th>
<th>Nationality</th>
<th>Passport</th>
<th>FATHER NAME</th>
<th>DESIGNATION & ORGANIZATION</th>
<th> FATHER MOBILE NUMBER</th>
<th>FATHER EMAIL ID</th>
<th>MOTHER NAME</th>
<th>DESIGNATION & ORGANIZATION</th>
<th>MOTHER MOBILE NUMBER</th>
<th>MOTHER EMAIL ID</th>
<th>PERMANENT ADDRESS WITH PINCODE</th>
<th>PERMANENT ADDRESS LINE 1</th>
<th>PERMANENT ADDRESS LINE 2</th>
<th>PERMANENT CITY</th>
<th>STATE</th>
<th>POSTAL CODE</th>
<th>HOSTEL / DAYSCHOLAR</th>

 
    </tr>
    </thead>
<%
    int sno=0;
    for(Student s:Student.getAll(Find.dept(username), batch, "%")){
%>
    <tr>
    <td><%=++sno%></td>
    <td><%=s.getRegno() %></td>
    <td><%=s.getId() %></td>
    <%
    if(s.getSex().contains("F"))
    {%>
    <td><%="Ms."%></td>
    <%}else{%>
    <td><%="Mr."%></td>
    <%}%>
    <td><%=s.getName() %></td>
    <td><%=s.getSex() %></td>
    <td><%=new SimpleDateFormat("dd/MM/yyyy").format(Date.valueOf(s.getGeneral().getDob())) %></td>
    <td><%=new SimpleDateFormat("MM/dd/yyyy").format(Date.valueOf(s.getGeneral().getDob())) %></td>
    <td><%=s.getGeneral().getDob() %></td>
    <td><%="St. Joseph's Institute of Technology"%></td>
    <%
    if(Find.sdept(s.getId()).equals("it"))
    {%>
    <td><%="B.Tech"%></td>
    <%}else{%>
    <td><%="B.E"%></td>
    <%}%>
    
    <td><%=Find.sdept(s.getId()).toUpperCase() %></td>
    <td><%=s.getSec().toUpperCase() %></td>
    <td><%=s.getAdmissionDetails().getDoa() %></td>
    
    <td><%=s.getAcademic().getTenthmark() %></td>
    <td><%=s.getAcademic().getTenthboard() %></td>
    <td><%=s.getAcademic().getTenthmedium()  %></td>
    <td><%=s.getAcademic().getTenthyearofpass() %></td>
    <td><%=s.getAcademic().getTenthschool() %></td>
    
    <td><%=s.getAcademic().getTwelfthmark() %></td>
    <td><%=s.getAcademic().getTwelfthboard()%></td>
    <td><%=s.getAcademic().getTwelfthmedium() %></td>
    <td><%=s.getAcademic().getTwelfthyearofpass() %></td>
    <td><%=s.getAcademic().getTwelfthschool() %></td>
    
    <td><%=s.getAcademic().getDiplomaboard() %></td>
    <td><%=s.getAcademic().getDiplomamark()%></td>
    <td><%=s.getAcademic().getDiplomayearofpass() %></td>
    <td><%=s.getAcademic().getDiplomaclg() %></td>
    
    
   
    
    
    
    <td><%=s.getFatherDetails().getLandline() %></td>
    <td><%=s.getMobile() %></td>
    <td><%=Parent.getNumber(s.getId()) %></td>
     <td><%=s.getMailid() %></td>
     <td><%=s.getAdmissionDetails().getSport() %></td>
     <td><%=s.getGeneral().getNationality() %></td>
     <td><%=s.getPassport().getPassno() %></td>
  
    
     <td><%=s.getFatherDetails().getFathername() %></td>
     <td><%=s.getFatherDetails().getDesig() %></td>
     <td><%=s.getFatherDetails().getMobile() %></td>
     <td><%=s.getFatherDetails().getMail() %></td>
     
     <td><%=s.getMotherDetails().getMothername() %></td>
     <td><%=s.getMotherDetails().getDesig() %></td>
     <td><%=s.getMotherDetails().getMobile() %></td>
     <td><%=s.getMotherDetails().getMail() %></td>
     
     <td><%=s.getMotherDetails().getAddress() %><br><%=s.getContact().getPincode()%></td>
     <td><%=s.getContact().getDoorno() %></td>
     <td><%=s.getContact().getStreet() %></td>
     <td><%=s.getContact().getCity() %></td>
     <td><%=s.getContact().getState()%></td>
     <td><%=s.getContact().getPincode()%></td>
     <td><%=s.getAccomodation() %></td>
    
    
    
    
    
    
        
    
    
    
    
    
    </tr>        
   <%
   }
   %> 
        
</table>
   
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
